using Microsoft.Extensions.Logging;
using Poseidon.Common;
using static Generator.Test.CodeGenerator;
using static Generator.Test.Root;

#if AUTH
using Duende.IdentityServer.EntityFramework.DbContexts;
using Microsoft.EntityFrameworkCore;
using Poseidon.Auth.Entities;
#endif

namespace Generator.Test
{
    public class Runner
    {
        private readonly ILogger<Runner>         _logger;
#if AUTH
        private readonly PoseidonAuthDbContext   _context;
        private readonly ConfigurationDbContext  _configCtx;
        private readonly PersistedGrantDbContext _persistedCtx;
#endif

        public Runner(
              ILogger<Runner>         logger
#if AUTH
            , PoseidonAuthDbContext   context
            , ConfigurationDbContext  configCtx
            , PersistedGrantDbContext persistedCtx
#endif
            )
        {
            _logger       = logger ?? throw new ArgumentNullException(nameof(logger));
#if AUTH
            _context      = context;
            _configCtx    = configCtx;
            _persistedCtx = persistedCtx; 
#endif
        }

        public async Task Run(string[] args)
        {
            _logger.Info("Running generator...");
            
            if (true) //True if Gen poseidon api code, false if  Auht and #define AUTH
            {
                if (string.IsNullOrWhiteSpace(ConnectionString))
                {
                    throw new InvalidOperationException("Connection string is not configured. Set ConnectionStrings:Default in Generator.Test/appsettings.json or user secrets.");
                }

                var model = (await CodeGeneratorClient.GetModelDefinitionAsync(ConnectionString)).ToArray();

                _logger.Info($"Loaded {model.Length} model definitions from database schema.");
                await GenerateCodeFromDbContet(model);
                var ordered = model.OrderBy(m => m.Fields?.Count(p => p.IsForeignKey) ?? 0);

                foreach (var item in ordered)
                {
                    Console.WriteLine($"{item.Name} Number of foreign keys {item.Fields?.Count(f => f.IsForeignKey) ?? 0}");
                }
            }
#if AUTH
            else
            {
                await GenerateAuthCode();
            }

            async Task GenerateAuthCode()
            {
                var model = GetMetaModelFromContext(_context);

                model.AddRange(GetMetaModelFromContext(_configCtx));

                model.AddRange(GetMetaModelFromContext(_persistedCtx));

                var mainPath = $"D:/Dev/poseidon/Generator.Test/AuthCode";

                await GenerateUsingTemplate("Commands.cst"       , $"{mainPath}/Commands.cs"       , model);
                                                                                                    
                await GenerateUsingTemplate("DtosAutoMapper.cst" , $"{mainPath}/Dtos.cs"           , model);
                                                                                                    
                await GenerateUsingTemplate("Queries.cst"        , $"{mainPath}/Queries.cs"        , model);
                  
                await GenerateUsingTemplate("CommandHandlers.cst", $"{mainPath}/CommandHandlers.cs", model);

                await GenerateUsingTemplate("Endpoints.cst"      , $"{mainPath}/Endpoints.cs"      , model);
            }
#endif
            async Task GenerateCodeFromDbContet(Model[] model)
            {
                // Per-entity Commands: one file per entity (e.g. AddressCommand.cs)
                foreach (var m in model)
                {
                    await GenerateUsingTemplate("Commands.cst", $"{commandPath}/{m.Name}Command.cs", new[] { m });
                }

                // Per-entity Dtos: one file per entity (e.g. AddressDto.cs)
                foreach (var m in model)
                {
                    await GenerateUsingTemplate("DtosAutoMapper.cst", $"{dtoPath}/{m.Name}Dto.cs", new[] { m });
                }

                // Queries and CommandHandlers are handled generically - no per-entity generation needed:
                //   Application/CommandHandlers/UpsertCommandHandler.cs handles all via IUpsertCommand<T>
                //   Endpoints use QueryCommand<TDto> directly (no per-entity Query classes needed)

                await GenerateUsingTemplate("PoseidonSwaggerExtensions.cst", $"{GenParallelPerformance}/PoseidonExtensions.cs", model);

                await GenerateUsingTemplate("DartCode.cst"                 , $"{GenCode}/DartCode.dart"                       , model);
               
                await GenerateUsingTemplate("PostOperations.cst"           , $"{GenCode}/PostOperations.cs"                    , model);


                //Only for testing
                Model[] orderedModel = new Model[]
                {
                          new Model() { Name = "Category"                     }
                        , new Model() { Name = "PaymentProvider"              }
                        , new Model() { Name = "Address"                      }
                        , new Model() { Name = "User"                         }
                        , new Model() { Name = "CreditCard"                   }
                        , new Model() { Name = "Cart"                         }
                        , new Model() { Name = "WishList"                     }
                        , new Model() { Name = "TaxRate"                      }
                        , new Model() { Name = "Product"                      }
                        , new Model() { Name = "DiscountOffer"                }
                        , new Model() { Name = "ProductDiscountOffer"         }
                        , new Model() { Name = "WishListItem"                 }
                        , new Model() { Name = "CartItem"                     }
                        , new Model() { Name = "Delivery"                     }
                        , new Model() { Name = "Order"                        }
                        , new Model() { Name = "Payment"                      }
                        , new Model() { Name = "OrderItem"                    }
                        , new Model() { Name = "UserProductReview"            }
                        , new Model() { Name = "Settings"                     }
                };

                await GenerateUsingTemplate("ParallelUseCases.cst", $"{GenParallelPerformance}/UseCases.cs", orderedModel);

                Save(PowershellFilePath, CreatePowerShellFunction(GeneratedFiles));
            }

            _logger.Info("Finished!");

            await Task.CompletedTask;
        }
    }
}
