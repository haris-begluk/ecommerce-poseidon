//using Fake.Services;
//using Microsoft.EntityFrameworkCore;
//using Poseidon.Auth.Entities;
//using Poseidon.Persistence;
//using System.ComponentModel.DataAnnotations;
//using System.ComponentModel.DataAnnotations.Schema;
//using System.Reflection;
//using System.Text.Json;

//namespace Generator.Test
//{
//    public static class MetaModel
//    {
//        public static List<Model> GetMetaModel(string connectionString)
//        {
//            var metaModel      = new List<Model>();
//            //var optionsBuilder = new DbContextOptionsBuilder<PoseidonDbContext>();
//            //optionsBuilder.UseSqlServer(connectionString); 

//            //using var context = new PoseidonDbContext( 
//            //    optionsBuilder.Options
//            //    , new FakeUserService() 
//            //    , new FakeDateTime()
//            //    ); 
                
            
//            var tables = context.Model.GetEntityTypes()
//                        .Select(t => new
//                        {
//                            Name        = t.ClrType.Name,
//                            SetName     = t.GetTableName(),
//                            Type        = t.ClrType,
//                            Properties  = t.GetProperties(),
//                            ForeignKeys = t.GetDeclaredForeignKeys(),
//                            PrimaryKeys = t.FindPrimaryKey().Properties,
//                            Navigations = t.GetNavigations(),
//                        })
//                        .Distinct()
//                        .ToList();
//            foreach (var item in tables.Where(t => !t.Name.Contains("Identity")).OrderBy(t => t.Name))
//            {
//                var model       = new Model() { Relations = new List<Relation>(), Fields = new List<Field>() };
//                model.Name      = item.Name;
//                model.DbSetName = item.SetName;
//                foreach (var prop in item.Properties)
//                {
//                    var modelProp = new Field
//                    {
//                        PropertyName = prop.Name,
//                        Type         = prop.ClrType.ToString(), 
//                        TypeName     = prop.ClrType.Name,
//                        DefaultValue = null,/*GetDefault(prop.GetType()).ToString()*/
//                        IsEnum       = prop.ClrType.IsEnum,
//                        IsForeignKey = prop.IsForeignKey(),
//                        IsGuid       = false,
//                        IsInternal   = false,
//                        IsCustom     = false,
//                        IsUnique     = prop.IsPrimaryKey(),
//                        IsNullable   = prop.IsNullable
//                    };

//                    if (prop.PropertyInfo != null)
//                        modelProp.PropertyAttribute = GetPropertyAttributes(prop.PropertyInfo);

//                    model.Fields.Add(modelProp);
//                } 

//                foreach (var nav in item.Navigations.Where(n => n.IsDependentToPrincipal()))
//                {
//                    model.Relations.Add(
//                        new Relation
//                        {
//                            Name         = nav.Name,
//                            RelatedModel = nav.ClrType.Name,
//                            IsOneToMany  = true,
//                            IsOneToOne   = false,
//                            IsUnique     = false,
//                            IsManyToOne  = false,
//                        });
//                }
//                foreach (var nav in item.Navigations.Where(n => n.IsCollection()))
//                {
//                    model.Relations.Add(
//                       new Relation
//                       {
//                           Name         = nav.Name,
//                           RelatedModel = nav.ClrType.GenericTypeArguments[0].Name,
//                           IsOneToMany  = false,
//                           IsOneToOne   = false,
//                           IsUnique     = false,
//                           IsManyToOne  = true,
//                       });
//                }
//                metaModel.Add(model);
//            }
//            return metaModel;
//        }
//        public static List<Model> GetMetaModelFromContext(DbContext context)
//        {
//            var metaModel = new List<Model>();
            
//            var tables = context.Model.GetEntityTypes()
//                        .Select(t => new
//                        {
//                            Name = t.ClrType.Name,
//                            SetName = t.GetTableName(),
//                            Type = t.ClrType,
//                            Properties = t.GetProperties(),
//                            ForeignKeys = t.GetDeclaredForeignKeys(),
//                            PrimaryKeys = t.FindPrimaryKey().Properties,
//                            Navigations = t.GetNavigations(),
//                        })
//                        .Distinct()
//                        .ToList();
//            foreach (var item in tables.OrderBy(t => t.Name))
//            {
//                var model = new Model() { Relations = new List<Relation>(), Fields = new List<Field>() };
//                model.Name = item.Name;
//                model.DbSetName = item.SetName;
//                foreach (var prop in item.Properties)
//                {
//                    var modelProp = new Field
//                    {
//                        PropertyName = prop.Name,
//                        Type = prop.ClrType.ToString(),
//                        TypeName = prop.ClrType.Name,
//                        DefaultValue = null,/*GetDefault(prop.GetType()).ToString()*/
//                        IsEnum = prop.ClrType.IsEnum,
//                        IsForeignKey = prop.IsForeignKey(),
//                        IsGuid = false,
//                        IsInternal = false,
//                        IsCustom = false,
//                        IsUnique = prop.IsPrimaryKey(),
//                        IsNullable = prop.IsNullable
//                    };

//                    if (prop.PropertyInfo != null)
//                        modelProp.PropertyAttribute = GetPropertyAttributes(prop.PropertyInfo);

//                    model.Fields.Add(modelProp);
//                }

//                foreach (var nav in item.Navigations.Where(n => n.IsDependentToPrincipal()))
//                {
//                    model.Relations.Add(
//                        new Relation
//                        {
//                            Name = nav.Name,
//                            RelatedModel = nav.ClrType.Name,
//                            IsOneToMany = true,
//                            IsOneToOne = false,
//                            IsUnique = false,
//                            IsManyToOne = false,
//                        });
//                }
//                foreach (var nav in item.Navigations.Where(n => n.IsCollection()))
//                {
//                    model.Relations.Add(
//                       new Relation
//                       {
//                           Name = nav.Name,
//                           RelatedModel = nav.ClrType.GenericTypeArguments[0].Name,
//                           IsOneToMany = false,
//                           IsOneToOne = false,
//                           IsUnique = false,
//                           IsManyToOne = true,
//                       });
//                }
//                metaModel.Add(model);
//            }
//            return metaModel;
//        }
//        private static List<PropertyAttribute> GetPropertyAttributes(PropertyInfo property)
//        {
//            var attributes = property.GetCustomAttributes(false);
//            var propertyAttributes = new List<PropertyAttribute>();
//            if (attributes.Any())
//                foreach (var attr in attributes)
//                {
//                    var type = attr.GetType();
//                    switch (type)
//                    {
//                        case var t when t.Equals(typeof(KeyAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        //case var t when t.Equals(typeof(PrimaryKeyAttribute)):
//                        //    propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                        //    Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} {2}", type, type.Name, property.Name);
//                        //    break;

//                        case var t when t.Equals(typeof(ForeignKeyAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(IndexAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(RequiredAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(TimestampAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(ConcurrencyCheckAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(MinLengthAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(MaxLengthAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(StringLengthAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(TableAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(ColumnAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(DatabaseGeneratedAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;

//                        case var t when t.Equals(typeof(ComplexTypeAttribute)):
//                            propertyAttributes.Add(new PropertyAttribute { Name = type.Name, Type = type.ToString(), Value = null });

//                            Console.WriteLine("ANONTATION {0} ON PROPERTY  {1} ", type, property.Name);
//                            break;
//                    };
//                }
//            return propertyAttributes;
//        }

//        public static void SaveModelToJsonFile(this object obj, string modelPath)
//        {
//            var model = JsonSerializer.Serialize(obj, new JsonSerializerOptions { WriteIndented = true });
//            if (File.Exists(modelPath))
//                File.Delete(modelPath);
//            File.WriteAllText(modelPath, model);
//        }
//        public static object GetDefault(this Type type)
//        {
//            return type.IsValueType ? (!type.IsGenericType ? Activator.CreateInstance(type) : type.GenericTypeArguments[0].GetDefaultMembers()) : null;
//        }

//        public static string AddParameter(string dataTypeName, string parameterName)
//        {
//            return $"\t\tpublic {dataTypeName} {parameterName} {{ get; set; }}" + Environment.NewLine;
//        }
//        public static string AddMapping(string destinationParam, string sourceParam)
//        {
//            return $"\t\t\t\t entity.{destinationParam}  = request.{sourceParam};" + Environment.NewLine;
//        }
//        public static string GetStartOfEnumClass(string nameSpace, string className)
//        {
//            return @"
//                    namespace " + nameSpace + @"
//                    {
//                        public enum " + className + @"
//                        {" + Environment.NewLine;
//        }
//        public static string AddEnum(string name, string value)
//        {
//            return $"\t\t{name} = {value}," + Environment.NewLine;
//        }

//    }
//}