namespace Generator.Test
{
    public class GeneratorTemplate
    {
        public static string GetDataType(Field field, bool allNullable = false)
        {
            string objectType = "object";
            string? typeName; 
            try
            { 
                //TODO: MAKE TYPE MAPPING SIMPLE
                var type = Type.GetType(field.Type);
                
                if (type is null)
                {
                    return objectType;
                }

                if (field.IsEnum)
                {
                    return field.TypeName;
                }
                string? typeToCheck = null;

                if(type.GenericTypeArguments.Length != 0)
                {
                    typeToCheck = type.GenericTypeArguments[0].Name;
                }
                
                typeName     = (typeToCheck ?? type.Name) switch 
                { 
                    string a when a.Contains("Boolean"       ) => "bool"          ,
                    string a when a.Contains("Byte"          ) => "byte"          ,
                    string a when a.Contains("SByte"         ) => "sbyte"         ,
                    string a when a.Contains("Char"          ) => "char"          ,
                    string a when a.Contains("Decimal"       ) => "decimal"       ,
                    string a when a.Contains("Double"        ) => "double"        ,
                    string a when a.Contains("Single"        ) => "float"         ,
                    string a when a.Contains("Int32"         ) => "int"           ,
                    string a when a.Contains("UInt32"        ) => "uint"          ,
                    string a when a.Contains("IntPtr"        ) => "nint"          ,
                    string a when a.Contains("UIntPtr"       ) => "nuint"         ,
                    string a when a.Contains("Int64"         ) => "long"          ,
                    string a when a.Contains("UInt64"        ) => "ulong"         ,
                    string a when a.Contains("Int16"         ) => "short"         ,
                    string a when a.Contains("UInt16"        ) => "ushort"        , 
                    string a when a.Contains("String"        ) => "string"        ,
                    string a when a.Contains("DateTimeOffset") => "DateTimeOffset",
                    string a when a.Contains("DateTime"      ) => "DateTime"      ,
                    _ => null
                };

                if (typeToCheck is null && typeName is null) 
                {
                    return objectType;
                }

                if (typeToCheck is not null && typeName is null)
                {
                    typeName = typeToCheck;
                } 
                //TODO: Mabe you can remove Contains check
                return allNullable || field.IsUnique || field.Type.Contains("nullable", StringComparison.OrdinalIgnoreCase) || field.IsNullable
                ? string.Format("{0}?", typeName!)
                : typeName!;

            }
            catch (Exception)
            {
                return objectType;
            }
        } 
    }
}