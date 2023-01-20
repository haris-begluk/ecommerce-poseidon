using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Domain;
using Stripe;

namespace Poseidon.Application.DataSeed
{
    public partial class SampleDataSeeder
    {
        private readonly IPoseidonDbContext _context;
        private readonly ILogger _logger;

        public SampleDataSeeder(
              IPoseidonDbContext context 
            , ILogger logger
            )
        {
            _context = context;
            _logger  = logger;
        }

        public async Task SeedAllAsync()
        {
            _logger.LogInformation("Starting data seed..."); 
           
            if (!_context.Settings.Any())
            {
                _logger.LogInformation("Seeding Settings...");
                await SeedSettings();
            }

            if (!_context.Delivery.Any())
            {
                _logger.LogInformation("Seeding delivery methods...");
                await SeedDelivery();
            }

            if (!_context.Country.Any())
            {
                _logger.LogInformation("Seeding countries...");
                await SeedCountriesAsync();
            }

            if (!_context.Address.Any())
            {
                _logger.LogInformation("Seeding address...");
                await SeedAddress();
            }
            if (!_context.Category.Any())
            {
                _logger.LogInformation("Seeding categories...");
                await SeedCategory();
            }

            if (!_context.User.Any())
            {
                _logger.LogInformation("Seeding user...");
                await SeedUsers();

                await SeedAndSaveTestData();
                _logger.LogInformation("Data seed done...");

                 await SeedOrder();
                _logger.LogInformation("Order seed done...");

            }

            if (_context.DiscountOffer.Any())
            {
                _logger.LogInformation("Remove empty discount offers...");
                await SeedRemoveEmptyOffers();
            }

        }
        private async Task SeedSettings()
        {

            _context.Settings.Add(new()
            {
                Description         = "Default settings",
                OrderDiscountAmount = 10m,
                OrderTaxAmount      = 0m,
                PaymentFeeAmount    = 0m,
                ShippingFeeAmount   = 0m,
                ShippingMethod      = "Vehicle",
                PaymentMethod       = "Credit card",
                Supplier            = "Poseidon Supplier"
            });

            await _context.SaveChangesAsync(default);
        }
        private async Task SeedDelivery()
        {

            _context.Delivery.AddRange(new Delivery[]
            {
               new()
               {
                   Title       = "Basic",
                   Description = "Could be delayed",
                   IsActive    = true
               },
               new()
               {
                   Title       = "Eco-friendly",
                   Description = "Could be delayed",
                   IsActive    = true
               },
               new()
               {
                   Title       = "Premium",
                   Description = "Order delivered in less than 1h",
                   IsActive    = true
               },
               new()
               {
                   Title       = "Instant",
                   Description = "Order delivered in less than 20 minutes",
                   IsActive    = true
               },
            });
            await _context.SaveChangesAsync(default);
        }

        private async Task SeedCategory()
            {

                _context.Category.AddRange(new Category[]
                {
                    new()
                    {
                         Name = "Fruit"
                    },
                    new()
                    {
                        Name = "Vegetables"
                    },
                    new ()
                    {
                        Name = "Pizza"
                    },
                    new()
                    {
                        Name = "Red meat"
                    },
                    new()
                    {
                       Name = "White meat"
                    },
                    new()
                    {
                       Name = "Fish"
                    },
                    new()
                    {
                       Name = "Soda drinks"
                    },
                    new()
                    {
                       Name = "Juices"
                    },
                });

                await _context.SaveChangesAsync(default);
            }
        
        private async Task SeedCountriesAsync()
        {
            var countries = new[] {
                new Country(){ Name = "Afghanistan"                                          , TwoLetterIsoCode =  "AF", ThreeLetterIsoCode = "AFG", NumericIsoCode = 4   , PhonePrefix = "93"                   },
                new Country(){ Name = "Åland Islands"                                        , TwoLetterIsoCode =  "AX", ThreeLetterIsoCode = "ALA", NumericIsoCode = 248 , PhonePrefix = "358"                  },
                new Country(){ Name = "Albania"                                              , TwoLetterIsoCode =  "AL", ThreeLetterIsoCode = "ALB", NumericIsoCode = 8   , PhonePrefix = "355"                  },
                new Country(){ Name = "Algeria"                                              , TwoLetterIsoCode =  "DZ", ThreeLetterIsoCode = "DZA", NumericIsoCode = 12  , PhonePrefix = "213"                  },
                new Country(){ Name = "American Samoa"                                       , TwoLetterIsoCode =  "AS", ThreeLetterIsoCode = "ASM", NumericIsoCode = 16  , PhonePrefix = "1 684"                },
                new Country(){ Name = "Andorra"                                              , TwoLetterIsoCode =  "AD", ThreeLetterIsoCode = "AND", NumericIsoCode = 20  , PhonePrefix = "376"                  },
                new Country(){ Name = "Angola"                                               , TwoLetterIsoCode =  "AO", ThreeLetterIsoCode = "AGO", NumericIsoCode = 24  , PhonePrefix = "244"                  },
                new Country(){ Name = "Anguilla"                                             , TwoLetterIsoCode =  "AI", ThreeLetterIsoCode = "AIA", NumericIsoCode = 660 , PhonePrefix = "1 264"                },
                new Country(){ Name = "Antarctica"                                           , TwoLetterIsoCode =  "AQ", ThreeLetterIsoCode = "ATA", NumericIsoCode = 10  , PhonePrefix = "672"                  },
                new Country(){ Name = "Antigua and Barbuda"                                  , TwoLetterIsoCode =  "AG", ThreeLetterIsoCode = "ATG", NumericIsoCode = 28  , PhonePrefix = "1 268"                },
                new Country(){ Name = "Argentina"                                            , TwoLetterIsoCode =  "AR", ThreeLetterIsoCode = "ARG", NumericIsoCode = 32  , PhonePrefix = "54"                   },
                new Country(){ Name = "Armenia"                                              , TwoLetterIsoCode =  "AM", ThreeLetterIsoCode = "ARM", NumericIsoCode = 51  , PhonePrefix = "374"                  },
                new Country(){ Name = "Aruba"                                                , TwoLetterIsoCode =  "AW", ThreeLetterIsoCode = "ABW", NumericIsoCode = 533 , PhonePrefix = "297"                  },
                new Country(){ Name = "Australia"                                            , TwoLetterIsoCode =  "AU", ThreeLetterIsoCode = "AUS", NumericIsoCode = 36  , PhonePrefix = "61"                   },
                new Country(){ Name = "Austria"                                              , TwoLetterIsoCode =  "AT", ThreeLetterIsoCode = "AUT", NumericIsoCode = 40  , PhonePrefix = "43"                   },
                new Country(){ Name = "Azerbaijan"                                           , TwoLetterIsoCode =  "AZ", ThreeLetterIsoCode = "AZE", NumericIsoCode = 31  , PhonePrefix = "994"                  },
                new Country(){ Name = "Bahamas"                                              , TwoLetterIsoCode =  "BS", ThreeLetterIsoCode = "BHS", NumericIsoCode = 44  , PhonePrefix = "1 242"                },
                new Country(){ Name = "Bahrain"                                              , TwoLetterIsoCode =  "BH", ThreeLetterIsoCode = "BHR", NumericIsoCode = 48  , PhonePrefix = "973"                  },
                new Country(){ Name = "Bangladesh"                                           , TwoLetterIsoCode =  "BD", ThreeLetterIsoCode = "BGD", NumericIsoCode = 50  , PhonePrefix = "880"                  },
                new Country(){ Name = "Barbados"                                             , TwoLetterIsoCode =  "BB", ThreeLetterIsoCode = "BRB", NumericIsoCode = 52  , PhonePrefix = "1 246"                },
                new Country(){ Name = "Belarus"                                              , TwoLetterIsoCode =  "BY", ThreeLetterIsoCode = "BLR", NumericIsoCode = 112 , PhonePrefix = "375"                  },
                new Country(){ Name = "Belgium"                                              , TwoLetterIsoCode =  "BE", ThreeLetterIsoCode = "BEL", NumericIsoCode = 56  , PhonePrefix = "32"                   },
                new Country(){ Name = "Belize"                                               , TwoLetterIsoCode =  "BZ", ThreeLetterIsoCode = "BLZ", NumericIsoCode = 84  , PhonePrefix = "501"                  },
                new Country(){ Name = "Benin"                                                , TwoLetterIsoCode =  "BJ", ThreeLetterIsoCode = "BEN", NumericIsoCode = 204 , PhonePrefix = "229"                  },
                new Country(){ Name = "Bermuda"                                              , TwoLetterIsoCode =  "BM", ThreeLetterIsoCode = "BMU", NumericIsoCode = 60  , PhonePrefix = "1 441"                },
                new Country(){ Name = "Bhutan"                                               , TwoLetterIsoCode =  "BT", ThreeLetterIsoCode = "BTN", NumericIsoCode = 64  , PhonePrefix = "975"                  },
                new Country(){ Name = "Bolivia (Plurinational State of)"                     , TwoLetterIsoCode =  "BO", ThreeLetterIsoCode = "BOL", NumericIsoCode = 68  , PhonePrefix = "591"                  },
                new Country(){ Name = "Bonaire , Sint Eustatius and Saba"                    , TwoLetterIsoCode =  "BQ", ThreeLetterIsoCode = "BES", NumericIsoCode = 535 , PhonePrefix = "599"                  },
                new Country(){ Name = "Bosnia and Herzegovina"                               , TwoLetterIsoCode =  "BA", ThreeLetterIsoCode = "BIH", NumericIsoCode = 70  , PhonePrefix = "387"                  },
                new Country(){ Name = "Botswana"                                             , TwoLetterIsoCode =  "BW", ThreeLetterIsoCode = "BWA", NumericIsoCode = 72  , PhonePrefix = "267"                  },
                new Country(){ Name = "Bouvet Island"                                        , TwoLetterIsoCode =  "BV", ThreeLetterIsoCode = "BVT", NumericIsoCode = 74  , PhonePrefix = ""                     },
                new Country(){ Name = "Brazil"                                               , TwoLetterIsoCode =  "BR", ThreeLetterIsoCode = "BRA", NumericIsoCode = 76  , PhonePrefix = "55"                   },
                new Country(){ Name = "British Indian Ocean Territory"                       , TwoLetterIsoCode =  "IO", ThreeLetterIsoCode = "IOT", NumericIsoCode = 86  , PhonePrefix = "246"                  },
                new Country(){ Name = "Brunei Darussalam"                                    , TwoLetterIsoCode =  "BN", ThreeLetterIsoCode = "BRN", NumericIsoCode = 96  , PhonePrefix = "673"                  },
                new Country(){ Name = "Bulgaria"                                             , TwoLetterIsoCode =  "BG", ThreeLetterIsoCode = "BGR", NumericIsoCode = 100 , PhonePrefix = "359"                  },
                new Country(){ Name = "Burkina Faso"                                         , TwoLetterIsoCode =  "BF", ThreeLetterIsoCode = "BFA", NumericIsoCode = 854 , PhonePrefix = "226"                  },
                new Country(){ Name = "Burundi"                                              , TwoLetterIsoCode =  "BI", ThreeLetterIsoCode = "BDI", NumericIsoCode = 108 , PhonePrefix = "257"                  },
                new Country(){ Name = "Cabo Verde"                                           , TwoLetterIsoCode =  "CV", ThreeLetterIsoCode = "CPV", NumericIsoCode = 132 , PhonePrefix = "238"                  },
                new Country(){ Name = "Cambodia"                                             , TwoLetterIsoCode =  "KH", ThreeLetterIsoCode = "KHM", NumericIsoCode = 116 , PhonePrefix = "855"                  },
                new Country(){ Name = "Cameroon"                                             , TwoLetterIsoCode =  "CM", ThreeLetterIsoCode = "CMR", NumericIsoCode = 120 , PhonePrefix = "237"                  },
                new Country(){ Name = "Canada"                                               , TwoLetterIsoCode =  "CA", ThreeLetterIsoCode = "CAN", NumericIsoCode = 124 , PhonePrefix = "1"                    },
                new Country(){ Name = "Cayman Islands"                                       , TwoLetterIsoCode =  "KY", ThreeLetterIsoCode = "CYM", NumericIsoCode = 136 , PhonePrefix = "1 345"                },
                new Country(){ Name = "Central African Republic"                             , TwoLetterIsoCode =  "CF", ThreeLetterIsoCode = "CAF", NumericIsoCode = 140 , PhonePrefix = "236"                  },
                new Country(){ Name = "Chad"                                                 , TwoLetterIsoCode =  "TD", ThreeLetterIsoCode = "TCD", NumericIsoCode = 148 , PhonePrefix = "235"                  },
                new Country(){ Name = "Chile"                                                , TwoLetterIsoCode =  "CL", ThreeLetterIsoCode = "CHL", NumericIsoCode = 152 , PhonePrefix = "56"                   },
                new Country(){ Name = "China"                                                , TwoLetterIsoCode =  "CN", ThreeLetterIsoCode = "CHN", NumericIsoCode = 156 , PhonePrefix = "86"                   },
                new Country(){ Name = "Christmas Island"                                     , TwoLetterIsoCode =  "CX", ThreeLetterIsoCode = "CXR", NumericIsoCode = 162 , PhonePrefix = "61"                   },
                new Country(){ Name = "Cocos (Keeling) Islands"                              , TwoLetterIsoCode =  "CC", ThreeLetterIsoCode = "CCK", NumericIsoCode = 166 , PhonePrefix = "61"                   },
                new Country(){ Name = "Colombia"                                             , TwoLetterIsoCode =  "CO", ThreeLetterIsoCode = "COL", NumericIsoCode = 170 , PhonePrefix = "57"                   },
                new Country(){ Name = "Comoros"                                              , TwoLetterIsoCode =  "KM", ThreeLetterIsoCode = "COM", NumericIsoCode = 174 , PhonePrefix = "269"                  },
                new Country(){ Name = "Congo"                                                , TwoLetterIsoCode =  "CG", ThreeLetterIsoCode = "COG", NumericIsoCode = 178 , PhonePrefix = "242"                  },
                new Country(){ Name = "Congo (Democratic Republic of the)"                   , TwoLetterIsoCode =  "CD", ThreeLetterIsoCode = "COD", NumericIsoCode = 180 , PhonePrefix = "243"                  },
                new Country(){ Name = "Cook Islands"                                         , TwoLetterIsoCode =  "CK", ThreeLetterIsoCode = "COK", NumericIsoCode = 184 , PhonePrefix = "682"                  },
                new Country(){ Name = "Costa Rica"                                           , TwoLetterIsoCode =  "CR", ThreeLetterIsoCode = "CRI", NumericIsoCode = 188 , PhonePrefix = "506"                  },
                new Country(){ Name = "Côte d'Ivoire"                                        , TwoLetterIsoCode =  "CI", ThreeLetterIsoCode = "CIV", NumericIsoCode = 384 , PhonePrefix = "225"                  },
                new Country(){ Name = "Croatia"                                              , TwoLetterIsoCode =  "HR", ThreeLetterIsoCode = "HRV", NumericIsoCode = 191 , PhonePrefix = "385"                  },
                new Country(){ Name = "Cuba"                                                 , TwoLetterIsoCode =  "CU", ThreeLetterIsoCode = "CUB", NumericIsoCode = 192 , PhonePrefix = "53"                   },
                new Country(){ Name = "Curaçao"                                              , TwoLetterIsoCode =  "CW", ThreeLetterIsoCode = "CUW", NumericIsoCode = 531 , PhonePrefix = "599"                  },
                new Country(){ Name = "Cyprus"                                               , TwoLetterIsoCode =  "CY", ThreeLetterIsoCode = "CYP", NumericIsoCode = 196 , PhonePrefix = "357"                  },
                new Country(){ Name = "Czechia"                                              , TwoLetterIsoCode =  "CZ", ThreeLetterIsoCode = "CZE", NumericIsoCode = 203 , PhonePrefix = "420"                  },
                new Country(){ Name = "Denmark"                                              , TwoLetterIsoCode =  "DK", ThreeLetterIsoCode = "DNK", NumericIsoCode = 208 , PhonePrefix = "45"                   },
                new Country(){ Name = "Djibouti"                                             , TwoLetterIsoCode =  "DJ", ThreeLetterIsoCode = "DJI", NumericIsoCode = 262 , PhonePrefix = "253"                  },
                new Country(){ Name = "Dominica"                                             , TwoLetterIsoCode =  "DM", ThreeLetterIsoCode = "DMA", NumericIsoCode = 212 , PhonePrefix = "1 767"                },
                new Country(){ Name = "Dominican Republic"                                   , TwoLetterIsoCode =  "DO", ThreeLetterIsoCode = "DOM", NumericIsoCode = 214 , PhonePrefix = "1 809 , 1 829 , 1 849"},
                new Country(){ Name = "Ecuador"                                              , TwoLetterIsoCode =  "EC", ThreeLetterIsoCode = "ECU", NumericIsoCode = 218 , PhonePrefix = "593"                  },
                new Country(){ Name = "Egypt"                                                , TwoLetterIsoCode =  "EG", ThreeLetterIsoCode = "EGY", NumericIsoCode = 818 , PhonePrefix = "20"                   },
                new Country(){ Name = "El Salvador"                                          , TwoLetterIsoCode =  "SV", ThreeLetterIsoCode = "SLV", NumericIsoCode = 222 , PhonePrefix = "503"                  },
                new Country(){ Name = "Equatorial Guinea"                                    , TwoLetterIsoCode =  "GQ", ThreeLetterIsoCode = "GNQ", NumericIsoCode = 226 , PhonePrefix = "240"                  },
                new Country(){ Name = "Eritrea"                                              , TwoLetterIsoCode =  "ER", ThreeLetterIsoCode = "ERI", NumericIsoCode = 232 , PhonePrefix = "291"                  },
                new Country(){ Name = "Estonia"                                              , TwoLetterIsoCode =  "EE", ThreeLetterIsoCode = "EST", NumericIsoCode = 233 , PhonePrefix = "372"                  },
                new Country(){ Name = "Eswatini"                                             , TwoLetterIsoCode =  "SZ", ThreeLetterIsoCode = "SWZ", NumericIsoCode = 748 , PhonePrefix = "268"                  },
                new Country(){ Name = "Ethiopia"                                             , TwoLetterIsoCode =  "ET", ThreeLetterIsoCode = "ETH", NumericIsoCode = 231 , PhonePrefix = "251"                  },
                new Country(){ Name = "Falkland Islands (Malvinas)"                          , TwoLetterIsoCode =  "FK", ThreeLetterIsoCode = "FLK", NumericIsoCode = 238 , PhonePrefix = "500"                  },
                new Country(){ Name = "Faroe Islands"                                        , TwoLetterIsoCode =  "FO", ThreeLetterIsoCode = "FRO", NumericIsoCode = 234 , PhonePrefix = "298"                  },
                new Country(){ Name = "Fiji"                                                 , TwoLetterIsoCode =  "FJ", ThreeLetterIsoCode = "FJI", NumericIsoCode = 242 , PhonePrefix = "679"                  },
                new Country(){ Name = "Finland"                                              , TwoLetterIsoCode =  "FI", ThreeLetterIsoCode = "FIN", NumericIsoCode = 246 , PhonePrefix = "358"                  },
                new Country(){ Name = "France"                                               , TwoLetterIsoCode =  "FR", ThreeLetterIsoCode = "FRA", NumericIsoCode = 250 , PhonePrefix = "33"                   },
                new Country(){ Name = "French Guiana"                                        , TwoLetterIsoCode =  "GF", ThreeLetterIsoCode = "GUF", NumericIsoCode = 254 , PhonePrefix = "594"                  },
                new Country(){ Name = "French Polynesia"                                     , TwoLetterIsoCode =  "PF", ThreeLetterIsoCode = "PYF", NumericIsoCode = 258 , PhonePrefix = "689"                  },
                new Country(){ Name = "French Southern Territories"                          , TwoLetterIsoCode =  "TF", ThreeLetterIsoCode = "ATF", NumericIsoCode = 260 , PhonePrefix = "262"                  },
                new Country(){ Name = "Gabon"                                                , TwoLetterIsoCode =  "GA", ThreeLetterIsoCode = "GAB", NumericIsoCode = 266 , PhonePrefix = "241"                  },
                new Country(){ Name = "Gambia"                                               , TwoLetterIsoCode =  "GM", ThreeLetterIsoCode = "GMB", NumericIsoCode = 270 , PhonePrefix = "220"                  },
                new Country(){ Name = "Georgia"                                              , TwoLetterIsoCode =  "GE", ThreeLetterIsoCode = "GEO", NumericIsoCode = 268 , PhonePrefix = "995"                  },
                new Country(){ Name = "Germany"                                              , TwoLetterIsoCode =  "DE", ThreeLetterIsoCode = "DEU", NumericIsoCode = 276 , PhonePrefix = "49"                   },
                new Country(){ Name = "Ghana"                                                , TwoLetterIsoCode =  "GH", ThreeLetterIsoCode = "GHA", NumericIsoCode = 288 , PhonePrefix = "233"                  },
                new Country(){ Name = "Gibraltar"                                            , TwoLetterIsoCode =  "GI", ThreeLetterIsoCode = "GIB", NumericIsoCode = 292 , PhonePrefix = "350"                  },
                new Country(){ Name = "Greece"                                               , TwoLetterIsoCode =  "GR", ThreeLetterIsoCode = "GRC", NumericIsoCode = 300 , PhonePrefix = "30"                   },
                new Country(){ Name = "Greenland"                                            , TwoLetterIsoCode =  "GL", ThreeLetterIsoCode = "GRL", NumericIsoCode = 304 , PhonePrefix = "299"                  },
                new Country(){ Name = "Grenada"                                              , TwoLetterIsoCode =  "GD", ThreeLetterIsoCode = "GRD", NumericIsoCode = 308 , PhonePrefix = "1 473"                },
                new Country(){ Name = "Guadeloupe"                                           , TwoLetterIsoCode =  "GP", ThreeLetterIsoCode = "GLP", NumericIsoCode = 312 , PhonePrefix = "590"                  },
                new Country(){ Name = "Guam"                                                 , TwoLetterIsoCode =  "GU", ThreeLetterIsoCode = "GUM", NumericIsoCode = 316 , PhonePrefix = "1 671"                },
                new Country(){ Name = "Guatemala"                                            , TwoLetterIsoCode =  "GT", ThreeLetterIsoCode = "GTM", NumericIsoCode = 320 , PhonePrefix = "502"                  },
                new Country(){ Name = "Guernsey"                                             , TwoLetterIsoCode =  "GG", ThreeLetterIsoCode = "GGY", NumericIsoCode = 831 , PhonePrefix = "44 1481"              },
                new Country(){ Name = "Guinea"                                               , TwoLetterIsoCode =  "GN", ThreeLetterIsoCode = "GIN", NumericIsoCode = 324 , PhonePrefix = "224"                  },
                new Country(){ Name = "Guinea-Bissau"                                        , TwoLetterIsoCode =  "GW", ThreeLetterIsoCode = "GNB", NumericIsoCode = 624 , PhonePrefix = "245"                  },
                new Country(){ Name = "Guyana"                                               , TwoLetterIsoCode =  "GY", ThreeLetterIsoCode = "GUY", NumericIsoCode = 328 , PhonePrefix = "592"                  },
                new Country(){ Name = "Haiti"                                                , TwoLetterIsoCode =  "HT", ThreeLetterIsoCode = "HTI", NumericIsoCode = 332 , PhonePrefix = "509"                  },
                new Country(){ Name = "Heard Island and McDonald Islands"                    , TwoLetterIsoCode =  "HM", ThreeLetterIsoCode = "HMD", NumericIsoCode = 334 , PhonePrefix = ""                     },
                new Country(){ Name = "Holy See"                                             , TwoLetterIsoCode =  "VA", ThreeLetterIsoCode = "VAT", NumericIsoCode = 336 , PhonePrefix = "379"                  },
                new Country(){ Name = "Honduras"                                             , TwoLetterIsoCode =  "HN", ThreeLetterIsoCode = "HND", NumericIsoCode = 340 , PhonePrefix = "504"                  },
                new Country(){ Name = "Hong Kong"                                            , TwoLetterIsoCode =  "HK", ThreeLetterIsoCode = "HKG", NumericIsoCode = 344 , PhonePrefix = "852"                  },
                new Country(){ Name = "Hungary"                                              , TwoLetterIsoCode =  "HU", ThreeLetterIsoCode = "HUN", NumericIsoCode = 348 , PhonePrefix = "36"                   },
                new Country(){ Name = "Iceland"                                              , TwoLetterIsoCode =  "IS", ThreeLetterIsoCode = "ISL", NumericIsoCode = 352 , PhonePrefix = "354"                  },
                new Country(){ Name = "India"                                                , TwoLetterIsoCode =  "IN", ThreeLetterIsoCode = "IND", NumericIsoCode = 356 , PhonePrefix = "91"                   },
                new Country(){ Name = "Indonesia"                                            , TwoLetterIsoCode =  "ID", ThreeLetterIsoCode = "IDN", NumericIsoCode = 360 , PhonePrefix = "62"                   },
                new Country(){ Name = "Iran (Islamic Republic of)"                           , TwoLetterIsoCode =  "IR", ThreeLetterIsoCode = "IRN", NumericIsoCode = 364 , PhonePrefix = "98"                   },
                new Country(){ Name = "Iraq"                                                 , TwoLetterIsoCode =  "IQ", ThreeLetterIsoCode = "IRQ", NumericIsoCode = 368 , PhonePrefix = "964"                  },
                new Country(){ Name = "Ireland"                                              , TwoLetterIsoCode =  "IE", ThreeLetterIsoCode = "IRL", NumericIsoCode = 372 , PhonePrefix = "353"                  },
                new Country(){ Name = "Isle of Man"                                          , TwoLetterIsoCode =  "IM", ThreeLetterIsoCode = "IMN", NumericIsoCode = 833 , PhonePrefix = "44 1624"              },
                new Country(){ Name = "Israel"                                               , TwoLetterIsoCode =  "IL", ThreeLetterIsoCode = "ISR", NumericIsoCode = 376 , PhonePrefix = "972"                  },
                new Country(){ Name = "Italy"                                                , TwoLetterIsoCode =  "IT", ThreeLetterIsoCode = "ITA", NumericIsoCode = 380 , PhonePrefix = "39"                   },
                new Country(){ Name = "Jamaica"                                              , TwoLetterIsoCode =  "JM", ThreeLetterIsoCode = "JAM", NumericIsoCode = 388 , PhonePrefix = "1 876"                },
                new Country(){ Name = "Japan"                                                , TwoLetterIsoCode =  "JP", ThreeLetterIsoCode = "JPN", NumericIsoCode = 392 , PhonePrefix = "81"                   },
                new Country(){ Name = "Jersey"                                               , TwoLetterIsoCode =  "JE", ThreeLetterIsoCode = "JEY", NumericIsoCode = 832 , PhonePrefix = "44 1534"              },
                new Country(){ Name = "Jordan"                                               , TwoLetterIsoCode =  "JO", ThreeLetterIsoCode = "JOR", NumericIsoCode = 400 , PhonePrefix = "962"                  },
                new Country(){ Name = "Kazakhstan"                                           , TwoLetterIsoCode =  "KZ", ThreeLetterIsoCode = "KAZ", NumericIsoCode = 398 , PhonePrefix = "7"                    },
                new Country(){ Name = "Kenya"                                                , TwoLetterIsoCode =  "KE", ThreeLetterIsoCode = "KEN", NumericIsoCode = 404 , PhonePrefix = "254"                  },
                new Country(){ Name = "Kiribati"                                             , TwoLetterIsoCode =  "KI", ThreeLetterIsoCode = "KIR", NumericIsoCode = 296 , PhonePrefix = "686"                  },
                new Country(){ Name = "Korea (Democratic People's Republic of)"              , TwoLetterIsoCode =  "KP", ThreeLetterIsoCode = "PRK", NumericIsoCode = 408 , PhonePrefix = "850"                  },
                new Country(){ Name = "Korea (Republic of)"                                  , TwoLetterIsoCode =  "KR", ThreeLetterIsoCode = "KOR", NumericIsoCode = 410 , PhonePrefix = "82"                   },
                new Country(){ Name = "Kuwait"                                               , TwoLetterIsoCode =  "KW", ThreeLetterIsoCode = "KWT", NumericIsoCode = 414 , PhonePrefix = "965"                  },
                new Country(){ Name = "Kyrgyzstan"                                           , TwoLetterIsoCode =  "KG", ThreeLetterIsoCode = "KGZ", NumericIsoCode = 417 , PhonePrefix = "996"                  },
                new Country(){ Name = "Lao People's Democratic Republic"                     , TwoLetterIsoCode =  "LA", ThreeLetterIsoCode = "LAO", NumericIsoCode = 418 , PhonePrefix = "856"                  },
                new Country(){ Name = "Latvia"                                               , TwoLetterIsoCode =  "LV", ThreeLetterIsoCode = "LVA", NumericIsoCode = 428 , PhonePrefix = "371"                  },
                new Country(){ Name = "Lebanon"                                              , TwoLetterIsoCode =  "LB", ThreeLetterIsoCode = "LBN", NumericIsoCode = 422 , PhonePrefix = "961"                  },
                new Country(){ Name = "Lesotho"                                              , TwoLetterIsoCode =  "LS", ThreeLetterIsoCode = "LSO", NumericIsoCode = 426 , PhonePrefix = "266"                  },
                new Country(){ Name = "Liberia"                                              , TwoLetterIsoCode =  "LR", ThreeLetterIsoCode = "LBR", NumericIsoCode = 430 , PhonePrefix = "231"                  },
                new Country(){ Name = "Libya"                                                , TwoLetterIsoCode =  "LY", ThreeLetterIsoCode = "LBY", NumericIsoCode = 434 , PhonePrefix = "218"                  },
                new Country(){ Name = "Liechtenstein"                                        , TwoLetterIsoCode =  "LI", ThreeLetterIsoCode = "LIE", NumericIsoCode = 438 , PhonePrefix = "423"                  },
                new Country(){ Name = "Lithuania"                                            , TwoLetterIsoCode =  "LT", ThreeLetterIsoCode = "LTU", NumericIsoCode = 440 , PhonePrefix = "370"                  },
                new Country(){ Name = "Luxembourg"                                           , TwoLetterIsoCode =  "LU", ThreeLetterIsoCode = "LUX", NumericIsoCode = 442 , PhonePrefix = "352"                  },
                new Country(){ Name = "Macao"                                                , TwoLetterIsoCode =  "MO", ThreeLetterIsoCode = "MAC", NumericIsoCode = 446 , PhonePrefix = "853"                  },
                new Country(){ Name = "North Macedonia"                                      , TwoLetterIsoCode =  "MK", ThreeLetterIsoCode = "MKD", NumericIsoCode = 807 , PhonePrefix = "389"                  },
                new Country(){ Name = "Madagascar"                                           , TwoLetterIsoCode =  "MG", ThreeLetterIsoCode = "MDG", NumericIsoCode = 450 , PhonePrefix = "261"                  },
                new Country(){ Name = "Malawi"                                               , TwoLetterIsoCode =  "MW", ThreeLetterIsoCode = "MWI", NumericIsoCode = 454 , PhonePrefix = "265"                  },
                new Country(){ Name = "Malaysia"                                             , TwoLetterIsoCode =  "MY", ThreeLetterIsoCode = "MYS", NumericIsoCode = 458 , PhonePrefix = "60"                   },
                new Country(){ Name = "Maldives"                                             , TwoLetterIsoCode =  "MV", ThreeLetterIsoCode = "MDV", NumericIsoCode = 462 , PhonePrefix = "960"                  },
                new Country(){ Name = "Mali"                                                 , TwoLetterIsoCode =  "ML", ThreeLetterIsoCode = "MLI", NumericIsoCode = 466 , PhonePrefix = "223"                  },
                new Country(){ Name = "Malta"                                                , TwoLetterIsoCode =  "MT", ThreeLetterIsoCode = "MLT", NumericIsoCode = 470 , PhonePrefix = "356"                  },
                new Country(){ Name = "Marshall Islands"                                     , TwoLetterIsoCode =  "MH", ThreeLetterIsoCode = "MHL", NumericIsoCode = 584 , PhonePrefix = "692"                  },
                new Country(){ Name = "Martinique"                                           , TwoLetterIsoCode =  "MQ", ThreeLetterIsoCode = "MTQ", NumericIsoCode = 474 , PhonePrefix = "596"                  },
                new Country(){ Name = "Mauritania"                                           , TwoLetterIsoCode =  "MR", ThreeLetterIsoCode = "MRT", NumericIsoCode = 478 , PhonePrefix = "222"                  },
                new Country(){ Name = "Mauritius"                                            , TwoLetterIsoCode =  "MU", ThreeLetterIsoCode = "MUS", NumericIsoCode = 480 , PhonePrefix = "230"                  },
                new Country(){ Name = "Mayotte"                                              , TwoLetterIsoCode =  "YT", ThreeLetterIsoCode = "MYT", NumericIsoCode = 175 , PhonePrefix = "262"                  },
                new Country(){ Name = "Mexico"                                               , TwoLetterIsoCode =  "MX", ThreeLetterIsoCode = "MEX", NumericIsoCode = 484 , PhonePrefix = "52"                   },
                new Country(){ Name = "Micronesia (Federated States of)"                     , TwoLetterIsoCode =  "FM", ThreeLetterIsoCode = "FSM", NumericIsoCode = 583 , PhonePrefix = "691"                  },
                new Country(){ Name = "Moldova (Republic of)"                                , TwoLetterIsoCode =  "MD", ThreeLetterIsoCode = "MDA", NumericIsoCode = 498 , PhonePrefix = "373"                  },
                new Country(){ Name = "Monaco"                                               , TwoLetterIsoCode =  "MC", ThreeLetterIsoCode = "MCO", NumericIsoCode = 492 , PhonePrefix = "377"                  },
                new Country(){ Name = "Mongolia"                                             , TwoLetterIsoCode =  "MN", ThreeLetterIsoCode = "MNG", NumericIsoCode = 496 , PhonePrefix = "976"                  },
                new Country(){ Name = "Montenegro"                                           , TwoLetterIsoCode =  "ME", ThreeLetterIsoCode = "MNE", NumericIsoCode = 499 , PhonePrefix = "382"                  },
                new Country(){ Name = "Montserrat"                                           , TwoLetterIsoCode =  "MS", ThreeLetterIsoCode = "MSR", NumericIsoCode = 500 , PhonePrefix = "1 664"                },
                new Country(){ Name = "Morocco"                                              , TwoLetterIsoCode =  "MA", ThreeLetterIsoCode = "MAR", NumericIsoCode = 504 , PhonePrefix = "212"                  },
                new Country(){ Name = "Mozambique"                                           , TwoLetterIsoCode =  "MZ", ThreeLetterIsoCode = "MOZ", NumericIsoCode = 508 , PhonePrefix = "258"                  },
                new Country(){ Name = "Myanmar"                                              , TwoLetterIsoCode =  "MM", ThreeLetterIsoCode = "MMR", NumericIsoCode = 104 , PhonePrefix = "95"                   },
                new Country(){ Name = "Namibia"                                              , TwoLetterIsoCode =  "NA", ThreeLetterIsoCode = "NAM", NumericIsoCode = 516 , PhonePrefix = "264"                  },
                new Country(){ Name = "Nauru"                                                , TwoLetterIsoCode =  "NR", ThreeLetterIsoCode = "NRU", NumericIsoCode = 520 , PhonePrefix = "674"                  },
                new Country(){ Name = "Nepal"                                                , TwoLetterIsoCode =  "NP", ThreeLetterIsoCode = "NPL", NumericIsoCode = 524 , PhonePrefix = "977"                  },
                new Country(){ Name = "Netherlands"                                          , TwoLetterIsoCode =  "NL", ThreeLetterIsoCode = "NLD", NumericIsoCode = 528 , PhonePrefix = "31"                   },
                new Country(){ Name = "New Caledonia"                                        , TwoLetterIsoCode =  "NC", ThreeLetterIsoCode = "NCL", NumericIsoCode = 540 , PhonePrefix = "687"                  },
                new Country(){ Name = "New Zealand"                                          , TwoLetterIsoCode =  "NZ", ThreeLetterIsoCode = "NZL", NumericIsoCode = 554 , PhonePrefix = "64"                   },
                new Country(){ Name = "Nicaragua"                                            , TwoLetterIsoCode =  "NI", ThreeLetterIsoCode = "NIC", NumericIsoCode = 558 , PhonePrefix = "505"                  },
                new Country(){ Name = "Niger"                                                , TwoLetterIsoCode =  "NE", ThreeLetterIsoCode = "NER", NumericIsoCode = 562 , PhonePrefix = "227"                  },
                new Country(){ Name = "Nigeria"                                              , TwoLetterIsoCode =  "NG", ThreeLetterIsoCode = "NGA", NumericIsoCode = 566 , PhonePrefix = "234"                  },
                new Country(){ Name = "Niue"                                                 , TwoLetterIsoCode =  "NU", ThreeLetterIsoCode = "NIU", NumericIsoCode = 570 , PhonePrefix = "683"                  },
                new Country(){ Name = "Norfolk Island"                                       , TwoLetterIsoCode =  "NF", ThreeLetterIsoCode = "NFK", NumericIsoCode = 574 , PhonePrefix = "672"                  },
                new Country(){ Name = "Northern Mariana Islands"                             , TwoLetterIsoCode =  "MP", ThreeLetterIsoCode = "MNP", NumericIsoCode = 580 , PhonePrefix = "1 670"                },
                new Country(){ Name = "Norway"                                               , TwoLetterIsoCode =  "NO", ThreeLetterIsoCode = "NOR", NumericIsoCode = 578 , PhonePrefix = "47"                   },
                new Country(){ Name = "Oman"                                                 , TwoLetterIsoCode =  "OM", ThreeLetterIsoCode = "OMN", NumericIsoCode = 512 , PhonePrefix = "968"                  },
                new Country(){ Name = "Pakistan"                                             , TwoLetterIsoCode =  "PK", ThreeLetterIsoCode = "PAK", NumericIsoCode = 586 , PhonePrefix = "92"                   },
                new Country(){ Name = "Palau"                                                , TwoLetterIsoCode =  "PW", ThreeLetterIsoCode = "PLW", NumericIsoCode = 585 , PhonePrefix = "680"                  },
                new Country(){ Name = "Palestine , State of"                                 , TwoLetterIsoCode =  "PS", ThreeLetterIsoCode = "PSE", NumericIsoCode = 275 , PhonePrefix = "970"                  },
                new Country(){ Name = "Panama"                                               , TwoLetterIsoCode =  "PA", ThreeLetterIsoCode = "PAN", NumericIsoCode = 591 , PhonePrefix = "507"                  },
                new Country(){ Name = "Papua New Guinea"                                     , TwoLetterIsoCode =  "PG", ThreeLetterIsoCode = "PNG", NumericIsoCode = 598 , PhonePrefix = "675"                  },
                new Country(){ Name = "Paraguay"                                             , TwoLetterIsoCode =  "PY", ThreeLetterIsoCode = "PRY", NumericIsoCode = 600 , PhonePrefix = "595"                  },
                new Country(){ Name = "Peru"                                                 , TwoLetterIsoCode =  "PE", ThreeLetterIsoCode = "PER", NumericIsoCode = 604 , PhonePrefix = "51"                   },
                new Country(){ Name = "Philippines"                                          , TwoLetterIsoCode =  "PH", ThreeLetterIsoCode = "PHL", NumericIsoCode = 608 , PhonePrefix = "63"                   },
                new Country(){ Name = "Pitcairn"                                             , TwoLetterIsoCode =  "PN", ThreeLetterIsoCode = "PCN", NumericIsoCode = 612 , PhonePrefix = "64"                   },
                new Country(){ Name = "Poland"                                               , TwoLetterIsoCode =  "PL", ThreeLetterIsoCode = "POL", NumericIsoCode = 616 , PhonePrefix = "48"                   },
                new Country(){ Name = "Portugal"                                             , TwoLetterIsoCode =  "PT", ThreeLetterIsoCode = "PRT", NumericIsoCode = 620 , PhonePrefix = "351"                  },
                new Country(){ Name = "Puerto Rico"                                          , TwoLetterIsoCode =  "PR", ThreeLetterIsoCode = "PRI", NumericIsoCode = 630 , PhonePrefix = "1 787 , 1 939"        },
                new Country(){ Name = "Qatar"                                                , TwoLetterIsoCode =  "QA", ThreeLetterIsoCode = "QAT", NumericIsoCode = 634 , PhonePrefix = "974"                  },
                new Country(){ Name = "Réunion"                                              , TwoLetterIsoCode =  "RE", ThreeLetterIsoCode = "REU", NumericIsoCode = 638 , PhonePrefix = "262"                  },
                new Country(){ Name = "Romania"                                              , TwoLetterIsoCode =  "RO", ThreeLetterIsoCode = "ROU", NumericIsoCode = 642 , PhonePrefix = "40"                   },
                new Country(){ Name = "Russian Federation"                                   , TwoLetterIsoCode =  "RU", ThreeLetterIsoCode = "RUS", NumericIsoCode = 643 , PhonePrefix = "7"                    },
                new Country(){ Name = "Rwanda"                                               , TwoLetterIsoCode =  "RW", ThreeLetterIsoCode = "RWA", NumericIsoCode = 646 , PhonePrefix = "250"                  },
                new Country(){ Name = "Saint Barthélemy"                                     , TwoLetterIsoCode =  "BL", ThreeLetterIsoCode = "BLM", NumericIsoCode = 652 , PhonePrefix = "590"                  },
                new Country(){ Name = "Saint Helena , Ascension and Tristan da Cunha"        , TwoLetterIsoCode =  "SH", ThreeLetterIsoCode = "SHN", NumericIsoCode = 654 , PhonePrefix = "290"                  },
                new Country(){ Name = "Saint Kitts and Nevis"                                , TwoLetterIsoCode =  "KN", ThreeLetterIsoCode = "KNA", NumericIsoCode = 659 , PhonePrefix = "1 869"                },
                new Country(){ Name = "Saint Lucia"                                          , TwoLetterIsoCode =  "LC", ThreeLetterIsoCode = "LCA", NumericIsoCode = 662 , PhonePrefix = "1 758"                },
                new Country(){ Name = "Saint Martin (French part)"                           , TwoLetterIsoCode =  "MF", ThreeLetterIsoCode = "MAF", NumericIsoCode = 663 , PhonePrefix = "590"                  },
                new Country(){ Name = "Saint Pierre and Miquelon"                            , TwoLetterIsoCode =  "PM", ThreeLetterIsoCode = "SPM", NumericIsoCode = 666 , PhonePrefix = "508"                  },
                new Country(){ Name = "Saint Vincent and the Grenadines"                     , TwoLetterIsoCode =  "VC", ThreeLetterIsoCode = "VCT", NumericIsoCode = 670 , PhonePrefix = "1 784"                },
                new Country(){ Name = "Samoa"                                                , TwoLetterIsoCode =  "WS", ThreeLetterIsoCode = "WSM", NumericIsoCode = 882 , PhonePrefix = "685"                  },
                new Country(){ Name = "San Marino"                                           , TwoLetterIsoCode =  "SP", ThreeLetterIsoCode = "SMR", NumericIsoCode = 674 , PhonePrefix = ""                     },
                new Country(){ Name = "Sao Tome and Principe"                                , TwoLetterIsoCode =  "ST", ThreeLetterIsoCode = "STP", NumericIsoCode = 678 , PhonePrefix = "239"                  },
                new Country(){ Name = "Saudi Arabia"                                         , TwoLetterIsoCode =  "SA", ThreeLetterIsoCode = "SAU", NumericIsoCode = 682 , PhonePrefix = "966"                  },
                new Country(){ Name = "Senegal"                                              , TwoLetterIsoCode =  "SN", ThreeLetterIsoCode = "SEN", NumericIsoCode = 686 , PhonePrefix = "221"                  },
                new Country(){ Name = "Serbia"                                               , TwoLetterIsoCode =  "RS", ThreeLetterIsoCode = "SRB", NumericIsoCode = 688 , PhonePrefix = "381"                  },
                new Country(){ Name = "Seychelles"                                           , TwoLetterIsoCode =  "SC", ThreeLetterIsoCode = "SYC", NumericIsoCode = 690 , PhonePrefix = "248"                  },
                new Country(){ Name = "Sierra Leone"                                         , TwoLetterIsoCode =  "SL", ThreeLetterIsoCode = "SLE", NumericIsoCode = 694 , PhonePrefix = "232"                  },
                new Country(){ Name = "Singapore"                                            , TwoLetterIsoCode =  "SG", ThreeLetterIsoCode = "SGP", NumericIsoCode = 702 , PhonePrefix = "65"                   },
                new Country(){ Name = "Sint Maarten (Dutch part)"                            , TwoLetterIsoCode =  "SX", ThreeLetterIsoCode = "SXM", NumericIsoCode = 534 , PhonePrefix = "1 72"                 },
                new Country(){ Name = "Slovakia"                                             , TwoLetterIsoCode =  "SK", ThreeLetterIsoCode = "SVK", NumericIsoCode = 703 , PhonePrefix = "421"                  },
                new Country(){ Name = "Slovenia"                                             , TwoLetterIsoCode =  "SI", ThreeLetterIsoCode = "SVN", NumericIsoCode = 705 , PhonePrefix = "386"                  },
                new Country(){ Name = "Solomon Islands"                                      , TwoLetterIsoCode =  "SB", ThreeLetterIsoCode = "SLB", NumericIsoCode = 90  , PhonePrefix = "677"                  },
                new Country(){ Name = "Somalia"                                              , TwoLetterIsoCode =  "SO", ThreeLetterIsoCode = "SOM", NumericIsoCode = 706 , PhonePrefix = "252"                  },
                new Country(){ Name = "South Africa"                                         , TwoLetterIsoCode =  "ZA", ThreeLetterIsoCode = "ZAF", NumericIsoCode = 710 , PhonePrefix = "27"                   },
                new Country(){ Name = "South Georgia and the South Sandwich Islands"         , TwoLetterIsoCode =  "GS", ThreeLetterIsoCode = "SGS", NumericIsoCode = 239 , PhonePrefix = "500"                  },
                new Country(){ Name = "South Sudan"                                          , TwoLetterIsoCode =  "SS", ThreeLetterIsoCode = "SSD", NumericIsoCode = 728 , PhonePrefix = "211"                  },
                new Country(){ Name = "Spain"                                                , TwoLetterIsoCode =  "ES", ThreeLetterIsoCode = "ESP", NumericIsoCode = 724 , PhonePrefix = "34"                   },
                new Country(){ Name = "Sri Lanka"                                            , TwoLetterIsoCode =  "LK", ThreeLetterIsoCode = "LKA", NumericIsoCode = 144 , PhonePrefix = "94"                   },
                new Country(){ Name = "Sudan"                                                , TwoLetterIsoCode =  "SD", ThreeLetterIsoCode = "SDN", NumericIsoCode = 729 , PhonePrefix = "249"                  },
                new Country(){ Name = "Suriname"                                             , TwoLetterIsoCode =  "SR", ThreeLetterIsoCode = "SUR", NumericIsoCode = 740 , PhonePrefix = "597"                  },
                new Country(){ Name = "Svalbard and Jan Mayen"                               , TwoLetterIsoCode =  "SJ", ThreeLetterIsoCode = "SJM", NumericIsoCode = 744 , PhonePrefix = "47"                   },
                new Country(){ Name = "Sweden"                                               , TwoLetterIsoCode =  "SE", ThreeLetterIsoCode = "SWE", NumericIsoCode = 752 , PhonePrefix = "46"                   },
                new Country(){ Name = "Switzerland"                                          , TwoLetterIsoCode =  "CH", ThreeLetterIsoCode = "CHE", NumericIsoCode = 756 , PhonePrefix = "41"                   },
                new Country(){ Name = "Syrian Arab Republic"                                 , TwoLetterIsoCode =  "SY", ThreeLetterIsoCode = "SYR", NumericIsoCode = 760 , PhonePrefix = "963"                  },
                new Country(){ Name = "Taiwan , Province of China"                           , TwoLetterIsoCode =  "TW", ThreeLetterIsoCode = "TWN", NumericIsoCode = 158 , PhonePrefix = "886"                  },
                new Country(){ Name = "Tajikistan"                                           , TwoLetterIsoCode =  "TJ", ThreeLetterIsoCode = "TJK", NumericIsoCode = 762 , PhonePrefix = "992"                  },
                new Country(){ Name = "Tanzania , United Republic of"                        , TwoLetterIsoCode =  "TZ", ThreeLetterIsoCode = "TZA", NumericIsoCode = 834 , PhonePrefix = "255"                  },
                new Country(){ Name = "Thailand"                                             , TwoLetterIsoCode =  "TH", ThreeLetterIsoCode = "THA", NumericIsoCode = 764 , PhonePrefix = "66"                   },
                new Country(){ Name = "Timor-Leste"                                          , TwoLetterIsoCode =  "TL", ThreeLetterIsoCode = "TLS", NumericIsoCode = 626 , PhonePrefix = "670"                  },
                new Country(){ Name = "Togo"                                                 , TwoLetterIsoCode =  "TG", ThreeLetterIsoCode = "TGO", NumericIsoCode = 768 , PhonePrefix = "228"                  },
                new Country(){ Name = "Tokelau"                                              , TwoLetterIsoCode =  "TK", ThreeLetterIsoCode = "TKL", NumericIsoCode = 772 , PhonePrefix = "690"                  },
                new Country(){ Name = "Tonga"                                                , TwoLetterIsoCode =  "TO", ThreeLetterIsoCode = "TON", NumericIsoCode = 776 , PhonePrefix = "676"                  },
                new Country(){ Name = "Trinidad and Tobago"                                  , TwoLetterIsoCode =  "TT", ThreeLetterIsoCode = "TTO", NumericIsoCode = 780 , PhonePrefix = "1 868"                },
                new Country(){ Name = "Tunisia"                                              , TwoLetterIsoCode =  "TN", ThreeLetterIsoCode = "TUN", NumericIsoCode = 788 , PhonePrefix = "216"                  },
                new Country(){ Name = "Turkey"                                               , TwoLetterIsoCode =  "TR", ThreeLetterIsoCode = "TUR", NumericIsoCode = 792 , PhonePrefix = "90"                   },
                new Country(){ Name = "Turkmenistan"                                         , TwoLetterIsoCode =  "TM", ThreeLetterIsoCode = "TKM", NumericIsoCode = 795 , PhonePrefix = "993"                  },
                new Country(){ Name = "Turks and Caicos Islands"                             , TwoLetterIsoCode =  "TC", ThreeLetterIsoCode = "TCA", NumericIsoCode = 796 , PhonePrefix = "1 649"                },
                new Country(){ Name = "Tuvalu"                                               , TwoLetterIsoCode =  "TV", ThreeLetterIsoCode = "TUV", NumericIsoCode = 798 , PhonePrefix = "688"                  },
                new Country(){ Name = "Uganda"                                               , TwoLetterIsoCode =  "UG", ThreeLetterIsoCode = "UGA", NumericIsoCode = 800 , PhonePrefix = "256"                  },
                new Country(){ Name = "Ukraine"                                              , TwoLetterIsoCode =  "UA", ThreeLetterIsoCode = "UKR", NumericIsoCode = 804 , PhonePrefix = "380"                  },
                new Country(){ Name = "United Arab Emirates"                                 , TwoLetterIsoCode =  "AE", ThreeLetterIsoCode = "ARE", NumericIsoCode = 784 , PhonePrefix = "971"                  },
                new Country(){ Name = "United Kingdom of Great Britain and Northern Ireland" , TwoLetterIsoCode =  "GB", ThreeLetterIsoCode = "GBR", NumericIsoCode = 826 , PhonePrefix = "44"                   },
                new Country(){ Name = "United States Minor Outlying Islands"                 , TwoLetterIsoCode =  "UM", ThreeLetterIsoCode = "UMI", NumericIsoCode = 581 , PhonePrefix = ""                     },
                new Country(){ Name = "United States of America"                             , TwoLetterIsoCode =  "US", ThreeLetterIsoCode = "USA", NumericIsoCode = 840 , PhonePrefix = "1"                    },
                new Country(){ Name = "Uruguay"                                              , TwoLetterIsoCode =  "UY", ThreeLetterIsoCode = "URY", NumericIsoCode = 858 , PhonePrefix = "598"                  },
                new Country(){ Name = "Uzbekistan"                                           , TwoLetterIsoCode =  "UZ", ThreeLetterIsoCode = "UZB", NumericIsoCode = 860 , PhonePrefix = "998"                  },
                new Country(){ Name = "Vanuatu"                                              , TwoLetterIsoCode =  "VU", ThreeLetterIsoCode = "VUT", NumericIsoCode = 548 , PhonePrefix = "678"                  },
                new Country(){ Name = "Venezuela (Bolivarian Republic of)"                   , TwoLetterIsoCode =  "VE", ThreeLetterIsoCode = "VEN", NumericIsoCode = 862 , PhonePrefix = "58"                   },
                new Country(){ Name = "Vietnam"                                              , TwoLetterIsoCode =  "VN", ThreeLetterIsoCode = "VNM", NumericIsoCode = 704 , PhonePrefix = "84"                   },
                new Country(){ Name = "Virgin Islands (British)"                             , TwoLetterIsoCode =  "VG", ThreeLetterIsoCode = "VGB", NumericIsoCode = 92  , PhonePrefix = "1 284"                },
                new Country(){ Name = "Virgin Islands (U.S.)"                                , TwoLetterIsoCode =  "VI", ThreeLetterIsoCode = "VIR", NumericIsoCode = 850 , PhonePrefix = "1 340"                },
                new Country(){ Name = "Wallis and Futuna"                                    , TwoLetterIsoCode =  "WF", ThreeLetterIsoCode = "WLF", NumericIsoCode = 876 , PhonePrefix = "681"                  },
                new Country(){ Name = "Western Sahara"                                       , TwoLetterIsoCode =  "EH", ThreeLetterIsoCode = "ESH", NumericIsoCode = 732 , PhonePrefix = "212"                  },
                new Country(){ Name = "Yemen"                                                , TwoLetterIsoCode =  "YE", ThreeLetterIsoCode = "YEM", NumericIsoCode = 887 , PhonePrefix = "967"                  },
                new Country(){ Name = "Zambia"                                               , TwoLetterIsoCode =  "ZM", ThreeLetterIsoCode = "ZMB", NumericIsoCode = 894 , PhonePrefix = "260"                  },
                new Country(){ Name = "Zimbabwe"                                             , TwoLetterIsoCode =  "ZW", ThreeLetterIsoCode = "ZWE", NumericIsoCode = 716 , PhonePrefix = "263"                  },
             };

            _context.Country.AddRange(countries);
            await _context.SaveChangesAsync(default);
        }

        private async Task SeedAddress()
        {

            var address = new Domain.Address[]
            {
                new ()
                {
                    Address1       = "Fjeldveien 09",
                    Address2       = "Default Address",
                    City           = "Tandborg",
                    Company        = "Poseidon AS",
                    CountryId      = 1,
                    County         = "Norway",
                    Email          = "alicebob@email.com",
                    FirstName      = "Alice",
                    LastName       = "Smith",
                    PhoneNumber    = "47 22233999",
                    ZipPostalCode  = "5460"
                },
            };

            _context.Address.AddRange(address);
            await _context.SaveChangesAsync(default);
        }
        private async Task SeedUsers()
        {

            var users = new User[]
            {
                new User
                {
                    Email = "alice.smith@email.com",
                    FirstName = "Alice",
                    LastName = "Smith",
                    Username = "alice",
                    PhoneNumber = "47 9933666",
                    AddressId = 1 ,
                    ExternalRef = "3e481369-3e1d-458a-93bf-1b6855f13aed"
                },
                new User
                {
                    Email = "bob.smith@email.com",
                    FirstName = "Bob",
                    LastName = "Smith",
                    Username = "bob",
                    PhoneNumber = "47 9933666",
                    AddressId = 1,
                    ExternalRef = "fff9a883-0dab-44e8-b323-deebafd5bfaf"

                },
                new User
                {
                    Email = "mobile.user@email.com",
                    FirstName = "Mobile",
                    LastName = "User",
                    Username = "mobile",
                    PhoneNumber = "47 9933666",
                    AddressId = 1 ,
                    ExternalRef = "3e484169-3e1d-458a-93bf-1b6855f13aed"
                },
                new User
                {
                    Email = "desktop.user@email.com",
                    FirstName = "Desktop",
                    LastName = "User",
                    Username = "desktop",
                    PhoneNumber = "47 9933666",
                    AddressId = 1,
                    ExternalRef = "56c55d0b-a0ea-42c6-8eeb-a834e9e2dd5e"

                }
            };

            _context.User.AddRange(users);
            await _context.SaveChangesAsync(default);
        }

        private async Task SeedOrder()
        {
            int  productIdMax  = _context.Product.Count();
            int  userIdMax     = _context.User.Count();
            Settings settings  = _context.Settings.First();

            Random random = new(434);

            for (int i = 1; i < userIdMax+1; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    _context.Order.Add(new Order()
                    {
                            
                            Description             = "Test data order"
                        ,   SubTotal                = Convert.ToDecimal(random.Next(0,1000))
                        ,   ProductTaxAmount        = Convert.ToDecimal(random.Next(0,1000))
                        ,   ProductDiscountAmount   = Convert.ToDecimal(random.Next(0,1000))
                        ,   OrderDiscountAmount     = Convert.ToDecimal(random.Next(0,1000))
                        ,   OrderTaxAmount          = Convert.ToDecimal(random.Next(0,1000))
                        ,   OrderTotal              = Convert.ToDecimal(random.Next(0,1000))
                        ,   OrderStatus             = "Closed"
                        ,   PayedAndClosed          = true
                        ,   ShippingMethod          = settings.ShippingMethod ?? "Instant"
                        ,   ShippingFeeAmount       = Convert.ToDecimal(random.Next(0,1000))
                        ,   PaymentMethod           = settings.ShippingMethod ?? "Credit Cart"
                        ,   PaymentFeeAmount        = Convert.ToDecimal(random.Next(0,1000))
                        ,   ShippingAddressId       = 1
                        ,   BillingAddressId        = 1
                        ,   UserId                  = i
                        ,   CartId                  = null
                        ,   DeliveryId              = 1

                           
                    });
                }
                await _context.SaveChangesAsync(default);
            }

            var orderIdMax = _context.Order.Count();

            for (int j = 0; j < userIdMax; j++)
            {
                for (int i = 0; i < 50; i++)
                {
                    _context.OrderItem.Add(new OrderItem()
                    {

                             ProductPrice     = Convert.ToDecimal(random.Next(0, 1000))
                         ,   Quantity         = Convert.ToDecimal(random.Next(0, 1000))
                         ,   DiscountAmount   = Convert.ToDecimal(random.Next(0, 1000))
                         ,   TaxAmount        = Convert.ToDecimal(random.Next(0, 1000))
                         ,   ProductId        = random.Next(1, productIdMax)
                         ,   OrderId          = random.Next(1, orderIdMax)
                    });
                }
                
            }

            await _context.SaveChangesAsync(default);
        }

        private async Task SeedRemoveEmptyOffers()
        {

            var emptyOffers = _context.DiscountOffer
                .Include(d => d.ProductDiscountOffer)
                .Where(o => !o.ProductDiscountOffer.Any())
                .ToArray(); 

            _context.DiscountOffer.RemoveRange(emptyOffers);

            await _context.SaveChangesAsync(default);
        }

    }
}