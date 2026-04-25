using Microsoft.Data.SqlClient;
using RazorLight;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace Generator.Test
{
    public static class CodeGeneratorClient
    {
        public static async Task<List<Model>> GetModelDefinitionAsync(string? connectionString = null)
        {
            var metaModel = new List<Model>();
            
            using SqlConnection conn = new(connectionString ?? Root.ConnectionString);
            await conn.OpenAsync();

            // Query to get all column information
            string columnQuery = @"
SELECT 
    t.name AS TableName,
    c.name AS ColumnName,
    ty.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable,
    c.column_id AS ColumnPosition,
    CASE WHEN pk.column_id IS NOT NULL THEN 1 ELSE 0 END AS IsPrimaryKey
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types ty ON c.system_type_id = ty.system_type_id AND c.user_type_id = ty.user_type_id
LEFT JOIN (
    SELECT ic.object_id, ic.column_id
    FROM sys.indexes i
    INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    WHERE i.is_primary_key = 1
) pk ON t.object_id = pk.object_id AND c.column_id = pk.column_id
WHERE t.is_ms_shipped = 0
ORDER BY t.name, c.column_id;";

            // Query to get foreign key relationships
            string fkQuery = @"
SELECT 
    parentTable.name AS TableName,
    parentCol.name AS ColumnName,
    refTable.name AS ReferencedTable,
    refCol.name AS ReferencedColumn
FROM sys.foreign_keys fk
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.tables parentTable ON fk.parent_object_id = parentTable.object_id
INNER JOIN sys.columns parentCol ON fkc.parent_column_id = parentCol.column_id AND fkc.parent_object_id = parentCol.object_id
INNER JOIN sys.tables refTable ON fk.referenced_object_id = refTable.object_id
INNER JOIN sys.columns refCol ON fkc.referenced_column_id = refCol.column_id AND fkc.referenced_object_id = refCol.object_id;";

            // Query to detect junction tables
            string junctionQuery = @"
;WITH ForeignKeyConstraints AS (
    SELECT 
        fk.parent_object_id AS table_id,
        COUNT(DISTINCT fk.object_id) AS fk_constraint_count,
        COUNT(DISTINCT fk.referenced_object_id) AS referenced_table_count
    FROM sys.foreign_keys fk
    GROUP BY fk.parent_object_id
),
TableColumns AS (
    SELECT 
        t.object_id,
        t.name AS TableName,
        COUNT(c.column_id) AS TotalColumns
    FROM sys.tables t
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    GROUP BY t.object_id, t.name
),
PrimaryKeyColumns AS (
    SELECT 
        ic.object_id,
        COUNT(ic.column_id) AS PKColumnCount
    FROM sys.indexes i
    INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    WHERE i.is_primary_key = 1
    GROUP BY ic.object_id
),
ReferencingTables AS (
    SELECT 
        fkc.referenced_object_id AS table_id,
        COUNT(DISTINCT fkc.parent_object_id) AS referencing_table_count
    FROM sys.foreign_key_columns fkc
    GROUP BY fkc.referenced_object_id
)
SELECT 
    t.name AS TableName,
    CASE 
        WHEN fk.fk_constraint_count = 2 
        AND fk.referenced_table_count = 2
        AND tc.TotalColumns BETWEEN 6 AND 8
        AND pk.PKColumnCount = 2
        AND ISNULL(rt.referencing_table_count, 0) = 0
        THEN 1 
        ELSE 0 
    END AS IsJunctionTable
FROM sys.tables t
LEFT JOIN ForeignKeyConstraints fk ON t.object_id = fk.table_id
LEFT JOIN TableColumns tc ON t.object_id = tc.object_id
LEFT JOIN PrimaryKeyColumns pk ON t.object_id = pk.object_id
LEFT JOIN ReferencingTables rt ON t.object_id = rt.table_id
WHERE t.is_ms_shipped = 0;";

            // First, get junction table information
            var junctionTables = new Dictionary<string, bool>();
            using (SqlCommand cmd = new(junctionQuery, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    string tableName = reader["TableName"].ToString() ?? "";
                    bool isJunction = Convert.ToBoolean(reader["IsJunctionTable"]);
                    junctionTables[tableName] = isJunction;
                }
            }

            // Get all columns and build Field objects
            var tableColumns = new Dictionary<string, List<Field>>();
            using (SqlCommand cmd = new(columnQuery, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    string tableName = reader["TableName"].ToString() ?? "";
                    string columnName = reader["ColumnName"].ToString() ?? "";
                    string dataType = reader["DataType"].ToString() ?? "";
                    int maxLength = Convert.ToInt32(reader["MaxLength"]);
                    bool isNullable = Convert.ToBoolean(reader["IsNullable"]);
                    bool isPrimaryKey = Convert.ToBoolean(reader["IsPrimaryKey"]);

                    if (!tableColumns.ContainsKey(tableName))
                    {
                        tableColumns[tableName] = new List<Field>();
                    }

                    var field = new Field
                    {
                        PropertyName = columnName,
                        Type = GetCsDataType(dataType, isNullable),
                        TypeName = GetCsDataType(dataType, false),
                        DefaultValue = null,
                        IsEnum = false,
                        IsForeignKey = false, // Will be updated later
                        IsGuid = dataType == "uniqueidentifier",
                        IsInternal = false,
                        IsCustom = false,
                        IsUnique = isPrimaryKey,
                        IsNullable = isNullable,
                        PropertyAttribute = new List<PropertyAttribute>()
                    };

                    tableColumns[tableName].Add(field);
                }
            }

            // Get foreign key relationships and build Relations
            var tableRelations = new Dictionary<string, List<Relation>>();
            
            using (SqlCommand cmd = new(fkQuery, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    string tableName = reader["TableName"].ToString() ?? "";
                    string columnName = reader["ColumnName"].ToString() ?? "";
                    string referencedTable = reader["ReferencedTable"].ToString() ?? "";
                    string referencedColumn = reader["ReferencedColumn"].ToString() ?? "";

                    // Find if the column is nullable
                    bool isNullable = false;
                    if (tableColumns.ContainsKey(tableName))
                    {
                        var field = tableColumns[tableName].FirstOrDefault(f => f.PropertyName == columnName);
                        if (field != null)
                        {
                            field.IsForeignKey = true;
                            isNullable = field.IsNullable;
                        }
                    }

                    // Add navigation property (many-to-one)
                    if (!tableRelations.ContainsKey(tableName))
                    {
                        tableRelations[tableName] = new List<Relation>();
                    }

                    tableRelations[tableName].Add(new Relation
                    {
                        Name = referencedTable,
                        RelatedModel = referencedTable,
                        ModelFieldname = columnName,
                        RelatedFieldname = referencedColumn,
                        IsOneToMany = true,
                        IsManyToOne = false,
                        IsOneToOne = false,
                        IsUnique = false,
                        PropertyAttribute = new List<PropertyAttribute>()
                    });

                    // Add inverse navigation property (one-to-many) to the referenced table
                    if (!tableRelations.ContainsKey(referencedTable))
                    {
                        tableRelations[referencedTable] = new List<Relation>();
                    }

                    tableRelations[referencedTable].Add(new Relation
                    {
                        Name = tableName,
                        RelatedModel = tableName,
                        ModelFieldname = referencedColumn,
                        RelatedFieldname = columnName,
                        IsOneToMany = false,
                        IsManyToOne = true,
                        IsOneToOne = false,
                        IsUnique = false,
                        PropertyAttribute = new List<PropertyAttribute>()
                    });
                }
            }

            // Build the Model objects
            // Exclude EF framework/infrastructure tables from code generation
            var excludedTables = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
            {
                "__EFMigrationsHistory"
            };

            foreach (var tableName in tableColumns.Keys.OrderBy(k => k))
            {
                if (excludedTables.Contains(tableName))
                    continue;

                var model = new Model
                {
                    Name = tableName,
                    DbSetName = tableName,
                    IsJunctionTable = junctionTables.ContainsKey(tableName) && junctionTables[tableName],
                    Fields = tableColumns[tableName],
                    Relations = tableRelations.ContainsKey(tableName) ? tableRelations[tableName] : new List<Relation>()
                };

                metaModel.Add(model);
            }

            return metaModel;
        }
        
        public static string GetCsDataType(string sqltype, bool nullable = false)
        {
            Dictionary<string, string> typeMappings = new ()
            {
                
                {"bigint"          , "long"          },
                {"binary"          , "byte[]"        },
                {"bit"             , "bool"          },
                {"char"            , "string"        },
                {"date"            , "DateTime"      },
                {"datetime"        , "DateTime"      },
                {"datetime2"       , "DateTime"      },
                {"datetimeoffset"  , "DateTimeOffset"},
                {"decimal"         , "decimal"       },
                {"float"           , "double"        },
                {"image"           , "byte[]"        },
                {"int"             , "int"           },
                {"money"           , "decimal"       },
                {"nchar"           , "string"        },
                {"ntext"           , "string"        },
                {"numeric"         , "decimal"       },
                {"nvarchar"        , "string"        },
                {"real"            , "float"         },
                {"rowversion"      , "byte[]"        },
                {"smalldatetime"   , "DateTime"      },
                {"smallint"        , "short"         },
                {"smallmoney"      , "decimal"       },
                {"sql_variant"     , "object"        },
                {"text"            , "string"        },
                {"time"            , "TimeSpan"      },
                {"timestamp"       , "byte[]"        },
                {"tinyint"         , "byte"          },
                {"uniqueidentifier", "Guid"          },
                {"varbinary"       , "byte[]"        },
                {"varchar"         , "string"        },
                {"xml"             , "string"        }
            };

            string baseType;
            if (typeMappings.ContainsKey(sqltype))
            {  
                baseType = typeMappings[sqltype];
            }
            else
            {
                baseType = "object";
            }

            // Add nullable indicator for value types (except string, byte[], and object)
            if (nullable && baseType != "string" && baseType != "byte[]" && baseType != "object")
            {
                baseType += "?";
            }

            return baseType;
        }
        
        public static string GetSpaces(int totalLength)
        {
            string result = string.Empty;
            for (int i = 0; i < totalLength; i++)
            {
                result += " ";
            }
            return result;
        }
        
        public static async Task GenerateUsingTemplate<TModel>(string templateName, string outputFile, TModel model)
        {
            await GenerateAndSaveCode(@$"{Root.GeneratorAppPath}\Templates\{templateName}", outputFile, model);
        }

        public static async Task GenerateAndSaveCode<TModel>(string templatePath, string outputFile, TModel model)
        {
            var destinationFileInfo = new FileInfo($"{outputFile}")!;

            try
            {
                var engine = new RazorLightEngineBuilder()
                .UseEmbeddedResourcesProject(typeof(Program))
                .SetOperatingAssembly(typeof(Program).Assembly)
                .UseMemoryCachingProvider()
                .Build();

                using StreamReader reader = new(templatePath);
                string templateString = reader.ReadToEnd();
                string content = await engine.CompileRenderStringAsync("Model", templateString, model);
                Console.WriteLine(content);

                Save(destinationFileInfo!, content);

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to process template {templatePath} with destination {destinationFileInfo.FullName} {ex.Message}");
                throw;
            }
        }

        public static string ToPascalCase(string identifier)
        {
            if (string.IsNullOrWhiteSpace(identifier))
                return string.Empty;

            identifier = string.Join(' ', Regex.Split(identifier, @"(?<!^)(?=[A-Z])"));
            var resultBuilder = new StringBuilder();
            var appendedSpace = false;

            foreach (char c in identifier)
            {
                if (!char.IsLetterOrDigit(c))
                {
                    resultBuilder.Append(" ");
                    appendedSpace = true;
                }
                else
                    resultBuilder.Append(c);
            }

            if (!appendedSpace)
            {
                var res = resultBuilder.ToString();
                return $"{char.ToUpperInvariant(res[0])}{res.Substring(1)}";
            }

            var result = resultBuilder.ToString().ToLower();
            return CultureInfo.InvariantCulture.TextInfo.ToTitleCase(result).Replace(" ", String.Empty);
        }


        public static void Save(FileInfo destinationFile, string content)
        {
            destinationFile!.Directory!.Create();
            File.WriteAllText(destinationFile.FullName, content);
        }
        
        public static void Save(string filePath, string content)
        => File.WriteAllText(filePath, content);
    }
}
