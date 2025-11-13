using Microsoft.Data.SqlClient;
using RazorLight;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace Generator.Test
{
    public static class CodeGeneratorClient
    {
        public static async Task<Dictionary<string, Model>> GetModelDefinitionAsync(string? connectionString = null)
        {
            using SqlConnection conn = new(connectionString ?? ConnectionString);
            await conn.OpenAsync();

            string query = @"
;WITH ForeignKeyInfo AS (  -- ADDED THIS
    SELECT 
        fk.name AS ForeignKeyName,
        parentTable.name AS TableName,
        parentCol.name AS ColumnName,
        refTable.name AS ReferencedTable,
        refCol.name AS ReferencedColumn
    FROM sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
    INNER JOIN sys.tables parentTable ON fk.parent_object_id = parentTable.object_id
    INNER JOIN sys.columns parentCol ON fkc.parent_column_id = parentCol.column_id AND fkc.parent_object_id = parentCol.object_id
    INNER JOIN sys.tables refTable ON fk.referenced_object_id = refTable.object_id
    INNER JOIN sys.columns refCol ON fkc.referenced_column_id = refCol.column_id AND fkc.referenced_object_id = refCol.object_id
),
ForeignKeyConstraints AS (  -- ADDED THIS
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
    c.name AS ColumnName,
    ty.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable,
    c.column_id AS ColumnPosition,
    CASE 
        WHEN fk.fk_constraint_count = 2 
        AND fk.referenced_table_count = 2
        AND tc.TotalColumns BETWEEN 6 AND 8
        AND pk.PKColumnCount = 2
        AND ISNULL(rt.referencing_table_count, 0) = 0
        THEN 1 
        ELSE 0 
    END AS IsJunctionTable,
    fi.ReferencedTable,  -- CHANGED FROM fk.ReferencedTable
    fi.ReferencedColumn  -- CHANGED FROM fk.ReferencedColumn
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types ty 
    ON c.system_type_id = ty.system_type_id 
    AND c.user_type_id = ty.user_type_id
LEFT JOIN ForeignKeyConstraints fk ON t.object_id = fk.table_id
LEFT JOIN TableColumns tc ON t.object_id = tc.object_id
LEFT JOIN PrimaryKeyColumns pk ON t.object_id = pk.object_id
LEFT JOIN ReferencingTables rt ON t.object_id = rt.table_id
LEFT JOIN ForeignKeyInfo fi  -- ADDED THIS JOIN
    ON t.name = fi.TableName 
    AND c.name = fi.ColumnName
ORDER BY t.name, c.column_id;";


            Dictionary<string, Model> Schema = [];

            using SqlCommand command = new(query, conn);
            using SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string tableName = reader[0].ToString() ?? "<NULL>";
                string columnName = reader[1].ToString() ?? "<NULL>";
                string dataType = reader[2].ToString() ?? "<NULL>";
                int maxLength = Convert.ToInt32(reader[3]);
                bool isNullable = Convert.ToBoolean(reader[4]);
                int columnPosition = Convert.ToInt32(reader[5]);
                bool isJunctionTable = Convert.ToBoolean(reader[6]);
                string? referencedTable = reader.IsDBNull(7) ? null : reader[7].ToString();
                string? referencedColumn = reader.IsDBNull(8) ? null : reader[8].ToString();

                if (!Schema.ContainsKey(tableName))
                {
                    Schema[tableName] = new Model
                    {
                        TableName = tableName,
                        IsJunctionTable = isJunctionTable
                    };
                }

                Schema[tableName].Properties.Add(new ModelProperty
                {
                    Name = columnName,
                    SqlType = dataType,
                    CsType = GetCsDataType(dataType, isNullable),
                    Length = maxLength,
                    IsNullable = isNullable,
                    ColumnPosition = columnPosition
                });

                if (referencedTable is not null && referencedColumn is not null)
                {
                    Schema[tableName].ForeignKeys.Add(new ForeignKeyInfo
                    {
                        ColumnName = columnName,
                        ReferencedTable = referencedTable,
                        ReferencedColumn = referencedColumn,
                        IsNullable = isNullable // <-- added here
                    });
                }
            }

            return Schema;
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

            if (typeMappings.ContainsKey(sqltype))
            {  
                return typeMappings[sqltype];
            }
            else
            {
                return "object";
            }
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
            await GenerateAndSaveCode(@$"{ProjectPath}\src\Medusa.Gen\Templates\{templateName}", outputFile, model);
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
