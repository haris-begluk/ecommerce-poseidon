namespace Poseidon.Endpoints;
public static partial class Endpoints
{
/*******************************************************
* Mapp all endpoints                              
*******************************************************/
    public static void  MappEndpoints(this WebApplication app) 
    {
        app.MappAddress             ();
        app.MappCart                ();
        app.MappCartItem            ();
        app.MappCategory            ();
        app.MappCountry             ();
        app.MappCreditCard          ();
        app.MappDelivery            ();
        app.MappDiscountOffer       ();
        app.MappOrder               ();
        app.MappOrderItem           ();
        app.MappPayment             ();
        app.MappPaymentProvider     ();
        app.MappProduct             ();
        app.MappProductDiscountOffer();
        app.MappSettings            ();
        app.MappTaxRate             ();
        app.MappUser                ();
        app.MappUserProductReview   ();
        app.MappWishList            ();
        app.MappWishListItem        ();
        app.MappCustomEndpoints();
    }
} 
