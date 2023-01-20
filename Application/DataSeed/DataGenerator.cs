using Bogus;
using Poseidon.Domain;
using System.Drawing;

namespace Poseidon.Application.DataSeed;
public static class DataGen<T> where T : class, IDataGen, new()
{
    private const decimal MaxDecimal = 1000.0000m; 
    private static readonly Faker _faker = new("nb_NO")
    {
        Random = new Randomizer(3691248)
    };
    private static string[] ImageUrls  = new string[] 
        {   
                "assets/images/food/apples.png"
            ,   "assets/images/food/bananas.png"
            ,   "assets/images/food/bakery.png"
            ,   "assets/images/food/beef_bone.png"
            ,   "assets/images/food/chicken.png"
            ,   "assets/images/food/coca_cola.png"
            ,   "assets/images/food/cola_diet.png"
            ,   "assets/images/food/egg_red.png"
            ,   "assets/images/food/egg_white.png"
            ,   "assets/images/food/fresh_fruits.png"
            ,   "assets/images/food/ginger.png"
            ,   "assets/images/food/juice_apple.png"
            ,   "assets/images/food/juice_orange.png"
            ,   "assets/images/food/mayonnais.png"
            ,   "assets/images/food/meat_fish.png"
            ,   "assets/images/food/noodles.png"
            ,   "assets/images/food/oils.png"
            ,   "assets/images/food/pasta.png"
            ,   "assets/images/food/peesi.png"
            ,   "assets/images/food/pepper.png"
            ,   "assets/images/food/pulses.png"
            ,   "assets/images/food/rice.png"
            ,   "assets/images/food/sprite.png"
        };

public static List<T> Generate(
          int userId
        , int instanceNumber = 10
        , bool skippIds = true

        )
    {
        var instanceList = new List<T>();

        for (int i = 0; i < instanceNumber; i++)
        {
            T instance = new();

            var props = instance
                        .GetType()
                        .GetProperties();

            var name = instance.GetType()
                                .Name;

         
            foreach (var prop in props)
            {

                var isId = skippIds && prop.Name.Equals($"{name}Id");

                switch (prop.PropertyType)
                {
                    case Type t when (t.Equals(typeof(string))):
                        if (prop.Name.Contains("email", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Internet.Email());
                        }
                        else
                        if (prop.Name.Contains("firstname", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Name.FirstName());
                        }
                        else
                        if (prop.Name.Contains("lastname", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Name.LastName());
                        }
                        else
                        if (prop.Name.Contains("name", StringComparison.InvariantCultureIgnoreCase))
                        {
                            if (name.Contains("product", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Commerce.ProductName());
                            }
                            else if (name.Contains("address", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Address.StreetName());
                            }
                            else
                            {
                                prop.SetValue(instance, _faker.Name.FullName());
                            }

                        }
                        else
                        {
                            if (prop.Name.Contains("address", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Address.StreetName());
                            }
                            else
                            if (prop.Name.Contains("phone", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Phone.PhoneNumber());
                            }
                            else
                            if (prop.Name.Contains("CreaditCartNumber", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, "4242424242424242");
                            }
                            else if (prop.Name.Contains("CVC", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, "342");
                            }
                            else
                            if (prop.Name.Contains("number", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Random.Int(1000, 1000000).ToString());
                            }
                            else
                            if (prop.Name.Contains("sku", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, $"POS{_faker.Random.Int(100000, 999999)}");
                            }
                            else
                            if (prop.Name.Contains("slug", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Lorem.Slug());
                            }
                            else
                            if (prop.Name.Contains("gtin", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, _faker.Random.Int(1000, 1000000).ToString());
                            }
                            else
                            if (prop.Name.Contains("imageUrl", StringComparison.InvariantCultureIgnoreCase))
                            {
                                prop.SetValue(instance, ImageUrls[_faker.Random.Int(0, ImageUrls.Length -1)]);
                            }
                            else
                            if (prop.Name.Contains("Unit", StringComparison.InvariantCultureIgnoreCase))
                            {
                                var units = new[] { "kg", "pcs" };
                                prop.SetValue(instance, units[_faker.Random.Int(0, units.Length - 1)]);
                            }
                            else
                            {
                                prop.SetValue(instance, _faker.Lorem.Text());
                            }
                        }

                        break;
                    case Type t when (t.Equals(typeof(int)) || t.Equals(typeof(int?))) && !isId:
                        if (prop.Name.Contains("userId", StringComparison.InvariantCultureIgnoreCase))
                        {

                            prop.SetValue(instance, userId);
                        }else
                        if (prop.Name.Contains("categoryId", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Random.Int(1, 8));
                        }else
                        {
                            prop.SetValue(instance, _faker.Random.Int(1, instanceNumber));
                        }
                        
                        break;
                    case Type t when (t.Equals(typeof(long)) || t.Equals(typeof(long?))) && !isId:
                        if (prop.Name.Contains("userId", StringComparison.InvariantCultureIgnoreCase))
                        {

                            prop.SetValue(instance, userId);
                        }
                        else
                        {
                            prop.SetValue(instance, _faker.Random.Long(1, instanceNumber));
                        }
                        break;
                    case Type t when (t.Equals(typeof(short)) || t.Equals(typeof(short?))) && !isId:

                        if (prop.Name.Contains("rating", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Random.Short(1, 5));
                        }
                        else
                        {
                            prop.SetValue(instance, _faker.Random.Short(1, (short)instanceNumber));
                        }
                        break;
                    case Type t when t.Equals(typeof(decimal)) || t.Equals(typeof(decimal?)):
                        if (prop.Name.Contains("price", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Random.Decimal(1.00m, 100.0m));
                        }
                        else
                        if (prop.Name.Contains("discount", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Random.Decimal(1.00m, 50.0m));
                        }else
                        if (prop.Name.Contains("rate", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Random.Decimal(1.00m, 20.0m));
                        }
                        else
                        {
                            prop.SetValue(instance, _faker.Random.Decimal(1.00m, MaxDecimal));
                        }
                        break;
                    case Type t when t.Equals(typeof(DateTimeOffset)) || t.Equals(typeof(DateTimeOffset?)):
                        prop.SetValue(instance, _faker.Date.PastOffset());
                        break;
                    case Type t when t.Equals(typeof(DateTime)) || t.Equals(typeof(DateTime?)):
                        if (prop.Name.Contains("Expiration", StringComparison.InvariantCultureIgnoreCase))
                        {
                            prop.SetValue(instance, _faker.Date.Future(3, DateTime.UtcNow));
                        }
                        else
                        {
                            prop.SetValue(instance, _faker.Date.Past());
                        }
                        break;
                    case Type t when t.Equals(typeof(bool)) || t.Equals(typeof(bool?)):
                        prop.SetValue(instance, _faker.Random.Bool(0.5f));
                        break;
                }
            }
            instanceList.Add(instance);
        }
        return instanceList;
    } 
}
