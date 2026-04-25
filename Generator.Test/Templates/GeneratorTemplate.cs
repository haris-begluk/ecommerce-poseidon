namespace Generator.Test
{
    public class GeneratorTemplate
    {
        /// <summary>
        /// Returns the C# type string for a field.
        /// field.Type is already a proper C# type alias set by CodeGeneratorClient.GetCsDataType
        /// (e.g. "string", "int?", "decimal", "DateTimeOffset?").
        /// </summary>
        public static string GetDataType(Field field, bool allNullable = false)
        {
            if (string.IsNullOrWhiteSpace(field.Type))
                return "object";

            if (field.IsEnum)
                return field.TypeName ?? "object";

            var type = field.Type; // e.g. "string", "int?", "decimal?", "DateTimeOffset"

            if (allNullable && !type.EndsWith("?") && type != "string" && type != "byte[]" && type != "object")
                return type + "?";

            return type;
        }
    }
}