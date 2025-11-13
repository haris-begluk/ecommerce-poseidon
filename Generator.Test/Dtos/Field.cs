using System.Collections.Generic;

namespace Generator.Test
{
    public class Field
    {
        public string DefaultValue { get; set; }
        public string PropertyName { get; set; }
        public bool   IsForeignKey { get; set; }
        public bool   IsGuid       { get; set; }
        public bool   IsNullable   { get; set; }
        public bool   IsUnique     { get; set; }
        public bool   IsInternal   { get; set; }
        public bool   IsCustom     { get; set; }
        public bool   IsEnum       { get; set; }
        public string Type         { get; set; }
        public string TypeName     { get; set; }
        public List<PropertyAttribute> PropertyAttribute { get; set; }
    }
}