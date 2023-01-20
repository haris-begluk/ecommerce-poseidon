using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Persistance.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Category",
                columns: table => new
                {
                    CategoryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Category", x => x.CategoryId);
                });

            migrationBuilder.CreateTable(
                name: "Country",
                columns: table => new
                {
                    CountryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TwoLetterIsoCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ThreeLetterIsoCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NumericIsoCode = table.Column<int>(type: "int", nullable: false),
                    PhonePrefix = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Country", x => x.CountryId);
                });

            migrationBuilder.CreateTable(
                name: "Delivery",
                columns: table => new
                {
                    DeliveryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Delivery", x => x.DeliveryId);
                });

            migrationBuilder.CreateTable(
                name: "DiscountOffer",
                columns: table => new
                {
                    DiscountOfferId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartDate = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    EndDate = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    Discount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DiscountOffer", x => x.DiscountOfferId);
                });

            migrationBuilder.CreateTable(
                name: "PaymentProvider",
                columns: table => new
                {
                    PaymentProviderId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AdditionalSettings = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PaymentProvider", x => x.PaymentProviderId);
                });

            migrationBuilder.CreateTable(
                name: "Settings",
                columns: table => new
                {
                    SettingsId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OrderDiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    OrderTaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    PaymentFeeAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    ShippingFeeAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    ShippingMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PaymentMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Supplier = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Settings", x => x.SettingsId);
                });

            migrationBuilder.CreateTable(
                name: "TaxRate",
                columns: table => new
                {
                    TaxRateId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Rate = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TaxRate", x => x.TaxRateId);
                });

            migrationBuilder.CreateTable(
                name: "Address",
                columns: table => new
                {
                    AddressId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Company = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    County = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address1 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address2 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ZipPostalCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CountryId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Address", x => x.AddressId);
                    table.ForeignKey(
                        name: "FK_Address_Country_CountryId",
                        column: x => x.CountryId,
                        principalTable: "Country",
                        principalColumn: "CountryId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Number = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Unit = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Price = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Gtin = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Supplier = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TaxRateId = table.Column<int>(type: "int", nullable: true),
                    CategoryId = table.Column<int>(type: "int", nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.ProductId);
                    table.ForeignKey(
                        name: "FK_Product_Category_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Category",
                        principalColumn: "CategoryId");
                    table.ForeignKey(
                        name: "FK_Product_TaxRate_TaxRateId",
                        column: x => x.TaxRateId,
                        principalTable: "TaxRate",
                        principalColumn: "TaxRateId");
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ExternalRef = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AddressId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.UserId);
                    table.ForeignKey(
                        name: "FK_User_Address_AddressId",
                        column: x => x.AddressId,
                        principalTable: "Address",
                        principalColumn: "AddressId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProductDiscountOffer",
                columns: table => new
                {
                    ProductDiscountOfferId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    DiscountOfferId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductDiscountOffer", x => x.ProductDiscountOfferId);
                    table.ForeignKey(
                        name: "FK_ProductDiscountOffer_DiscountOffer_DiscountOfferId",
                        column: x => x.DiscountOfferId,
                        principalTable: "DiscountOffer",
                        principalColumn: "DiscountOfferId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductDiscountOffer_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Cart",
                columns: table => new
                {
                    CartId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    LockedOnCheckout = table.Column<bool>(type: "bit", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Total = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    TaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    DiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cart", x => x.CartId);
                    table.ForeignKey(
                        name: "FK_Cart_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CreditCard",
                columns: table => new
                {
                    CreditCardId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreaditCartNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CVC = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpirationDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    PaymentProviderId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CreditCard", x => x.CreditCardId);
                    table.ForeignKey(
                        name: "FK_CreditCard_PaymentProvider_PaymentProviderId",
                        column: x => x.PaymentProviderId,
                        principalTable: "PaymentProvider",
                        principalColumn: "PaymentProviderId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CreditCard_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserProductReview",
                columns: table => new
                {
                    UserProductReviewId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Comment = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Rating = table.Column<short>(type: "smallint", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserProductReview", x => x.UserProductReviewId);
                    table.ForeignKey(
                        name: "FK_UserProductReview_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserProductReview_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WishList",
                columns: table => new
                {
                    WishListId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WishList", x => x.WishListId);
                    table.ForeignKey(
                        name: "FK_WishList_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CartItem",
                columns: table => new
                {
                    CartItemId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Quantity = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    Price = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    DiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    TaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Unit = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CartId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CartItem", x => x.CartItemId);
                    table.ForeignKey(
                        name: "FK_CartItem_Cart_CartId",
                        column: x => x.CartId,
                        principalTable: "Cart",
                        principalColumn: "CartId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CartItem_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Order",
                columns: table => new
                {
                    OrderId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SubTotal = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    ProductTaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    ProductDiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    OrderDiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    OrderTaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    OrderTotal = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    OrderStatus = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PayedAndClosed = table.Column<bool>(type: "bit", nullable: false),
                    ShippingMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ShippingFeeAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    PaymentMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PaymentFeeAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    ShippingAddressId = table.Column<int>(type: "int", nullable: true),
                    BillingAddressId = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    CartId = table.Column<int>(type: "int", nullable: true),
                    DeliveryId = table.Column<int>(type: "int", nullable: true),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Order", x => x.OrderId);
                    table.ForeignKey(
                        name: "FK_Order_Address_BillingAddressId",
                        column: x => x.BillingAddressId,
                        principalTable: "Address",
                        principalColumn: "AddressId");
                    table.ForeignKey(
                        name: "FK_Order_Address_ShippingAddressId",
                        column: x => x.ShippingAddressId,
                        principalTable: "Address",
                        principalColumn: "AddressId");
                    table.ForeignKey(
                        name: "FK_Order_Cart_CartId",
                        column: x => x.CartId,
                        principalTable: "Cart",
                        principalColumn: "CartId");
                    table.ForeignKey(
                        name: "FK_Order_Delivery_DeliveryId",
                        column: x => x.DeliveryId,
                        principalTable: "Delivery",
                        principalColumn: "DeliveryId");
                    table.ForeignKey(
                        name: "FK_Order_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WishListItem",
                columns: table => new
                {
                    WishListItemId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Quantity = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: true),
                    WishListId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WishListItem", x => x.WishListItemId);
                    table.ForeignKey(
                        name: "FK_WishListItem_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WishListItem_WishList_WishListId",
                        column: x => x.WishListId,
                        principalTable: "WishList",
                        principalColumn: "WishListId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "OrderItem",
                columns: table => new
                {
                    OrderItemId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductPrice = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    Quantity = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    DiscountAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    TaxAmount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    OrderId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderItem", x => x.OrderItemId);
                    table.ForeignKey(
                        name: "FK_OrderItem_Order_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Order",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_OrderItem_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Payment",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Amount = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    PaymentFee = table.Column<decimal>(type: "decimal(19,4)", precision: 19, scale: 4, nullable: false),
                    FailureMessage = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OrderId = table.Column<int>(type: "int", nullable: false),
                    PaymentProviderId = table.Column<int>(type: "int", nullable: false),
                    SysCreatedBy = table.Column<string>(name: "Sys_CreatedBy", type: "nvarchar(max)", nullable: false),
                    SysCreatedAt = table.Column<DateTimeOffset>(name: "Sys_CreatedAt", type: "datetimeoffset", nullable: false),
                    SysUpdatedBy = table.Column<string>(name: "Sys_UpdatedBy", type: "nvarchar(max)", nullable: false),
                    SysUpdatedAt = table.Column<DateTimeOffset>(name: "Sys_UpdatedAt", type: "datetimeoffset", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payment", x => x.PaymentId);
                    table.ForeignKey(
                        name: "FK_Payment_Order_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Order",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Payment_PaymentProvider_PaymentProviderId",
                        column: x => x.PaymentProviderId,
                        principalTable: "PaymentProvider",
                        principalColumn: "PaymentProviderId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Address_CountryId",
                table: "Address",
                column: "CountryId");

            migrationBuilder.CreateIndex(
                name: "IX_Cart_UserId",
                table: "Cart",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_CartItem_CartId",
                table: "CartItem",
                column: "CartId");

            migrationBuilder.CreateIndex(
                name: "IX_CartItem_ProductId",
                table: "CartItem",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_CreditCard_PaymentProviderId",
                table: "CreditCard",
                column: "PaymentProviderId");

            migrationBuilder.CreateIndex(
                name: "IX_CreditCard_UserId",
                table: "CreditCard",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_BillingAddressId",
                table: "Order",
                column: "BillingAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_CartId",
                table: "Order",
                column: "CartId",
                unique: true,
                filter: "[CartId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Order_DeliveryId",
                table: "Order",
                column: "DeliveryId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_ShippingAddressId",
                table: "Order",
                column: "ShippingAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_UserId",
                table: "Order",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderItem_OrderId",
                table: "OrderItem",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderItem_ProductId",
                table: "OrderItem",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Payment_OrderId",
                table: "Payment",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_Payment_PaymentProviderId",
                table: "Payment",
                column: "PaymentProviderId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_CategoryId",
                table: "Product",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_TaxRateId",
                table: "Product",
                column: "TaxRateId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductDiscountOffer_DiscountOfferId",
                table: "ProductDiscountOffer",
                column: "DiscountOfferId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductDiscountOffer_ProductId",
                table: "ProductDiscountOffer",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_User_AddressId",
                table: "User",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_UserProductReview_ProductId",
                table: "UserProductReview",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_UserProductReview_UserId",
                table: "UserProductReview",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_WishList_UserId",
                table: "WishList",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_WishListItem_ProductId",
                table: "WishListItem",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_WishListItem_WishListId",
                table: "WishListItem",
                column: "WishListId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CartItem");

            migrationBuilder.DropTable(
                name: "CreditCard");

            migrationBuilder.DropTable(
                name: "OrderItem");

            migrationBuilder.DropTable(
                name: "Payment");

            migrationBuilder.DropTable(
                name: "ProductDiscountOffer");

            migrationBuilder.DropTable(
                name: "Settings");

            migrationBuilder.DropTable(
                name: "UserProductReview");

            migrationBuilder.DropTable(
                name: "WishListItem");

            migrationBuilder.DropTable(
                name: "Order");

            migrationBuilder.DropTable(
                name: "PaymentProvider");

            migrationBuilder.DropTable(
                name: "DiscountOffer");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "WishList");

            migrationBuilder.DropTable(
                name: "Cart");

            migrationBuilder.DropTable(
                name: "Delivery");

            migrationBuilder.DropTable(
                name: "Category");

            migrationBuilder.DropTable(
                name: "TaxRate");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "Address");

            migrationBuilder.DropTable(
                name: "Country");
        }
    }
}
