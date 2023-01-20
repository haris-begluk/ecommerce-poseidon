
using Swagger.Poseidon;

namespace Poseidon.WinUI.Forms
{
    public partial class frmOrderDetails : Form
    {

        private readonly long _orderId;
        private OrderDto? _orderDetails;

        public frmOrderDetails(long orderId)
        {
            InitializeComponent();
            _orderId     = orderId;
        }

        private void frmOrderDetails_Load(object sender, EventArgs e)
        {
            LoadOrderDetails();
            LoadOrderItems();
        }

        private async void LoadOrderDetails()
        {
            var apiClient = await CreatePoseidonClient();

            var result = await apiClient.ApiOrderQueryAsync(1, 1000, $"orderId={_orderId}", null);

            _orderDetails = null;
            _orderDetails = result.Items?.FirstOrDefault();

            var user = await apiClient.ApiUserQueryAsync(1, 1000, $"userId={_orderDetails?.UserId}", null);

            var _userDetails = user.Items?.FirstOrDefault();

            lblOrderNumber.Text         = "Order number: " + _orderDetails!.OrderId.ToString();
            lblUser.Text                = $"User: {_userDetails?.FirstName} {_userDetails?.LastName} email: {_userDetails?.Email}".Truncate(50);
            lblOrderDate.Text           = $"Order date: {_orderDetails.Sys_CreatedAt?.ToString("dd.MM.yyyy")}";
            lblPayedClosed.Text         = $"Closed (Payed): {(_orderDetails.PayedAndClosed is null || _orderDetails.PayedAndClosed == false ? "NO" : "Yes")}";
            lblOrderTotal.Text          = $"Order total: {_orderDetails!.OrderTotal}";
            lblOrderDiscount.Text       = $"Order discount amount: {_orderDetails.OrderDiscountAmount}";
            lblOrderTaxAmount.Text      = $"Order tax amount: {_orderDetails.OrderTaxAmount}";
            lblSubTotal.Text            = $"Order sub total: {_orderDetails.SubTotal}";
            lblPaymentMethod.Text       = $"Payment method: {_orderDetails.PaymentMethod}";
            lblPaymentFee.Text          = $"Payment fee amount: {_orderDetails.PaymentFeeAmount}";
            lblShippingMethod.Text      = $"Shipping method: {_orderDetails.ShippingMethod}";
            lblShippingFee.Text         = $"Shipping fee amount: {_orderDetails.ShippingFeeAmount}";
            lblProductDiscount.Text     = $"Product discount amount: {_orderDetails.ProductDiscountAmount}";
            lblProductTaxAmount.Text    = $"Product tax amount: {_orderDetails.ProductTaxAmount}";
            lblStatus.Text              = $"Order status: {_orderDetails.OrderStatus}";
            lblDescription.Text         = $"Description: {_orderDetails.Description}".Truncate(150);

        }
        private async void LoadOrderItems()
        {
            var apiClient = await CreatePoseidonClient();
            var result = await apiClient.ApiOrderitemDetailsAsync(1, 1000, $"orderId={_orderId}" ,"orderItemId");
            var resultItems = 

            orderItemsGrid.AutoGenerateColumns = false; 
            if(result?.Items is not null)
            {
                orderItemsGrid.DataSource = result?.Items?.Select(p => new
                {
                    p.OrderItemId,
                    p.ProductPrice,
                    p.DiscountAmount,
                    p.Quantity,
                    p.ProductName,
                    p.Total
                }).ToArray();
            }
            
        }
    }
}
