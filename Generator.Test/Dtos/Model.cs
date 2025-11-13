using System.Collections.Generic;

namespace Generator.Test
{
    public class Model
    {
        public string         Name      { get; set; }
        public string         DbSetName { get; set; }
        public List<Field>    Fields    { get; set; }
        public List<Relation> Relations { get; set; }
    }
}