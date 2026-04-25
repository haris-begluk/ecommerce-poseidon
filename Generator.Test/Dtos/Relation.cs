using System.Collections.Generic;

namespace Generator.Test
{
    public class Relation
    {
        public string Name { get; set; }
        public string RelatedModel { get; set; }
        public string ModelFieldname { get; set; }
        public string RelatedFieldname { get; set; }
        public bool IsOneToMany { get; set; }
        public bool IsManyToOne { get; set; }
        public bool IsOneToOne { get; set; }
        public bool IsUnique { get; set; }
        public List<PropertyAttribute> PropertyAttribute { get; set; }
    }
}