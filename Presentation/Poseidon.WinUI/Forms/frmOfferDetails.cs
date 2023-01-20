
using Swagger.Poseidon;

namespace Poseidon.WinUI.Forms
{
    public partial class frmOfferDetail : Form
    {

        private readonly int      _discountOfferId;
        private DiscountOfferDto?  _discountOffer;
        private int               _productIdToAdd = 0;

        public frmOfferDetail(int discountOfferId)
        {
            InitializeComponent();
            _discountOfferId = discountOfferId;
        }

        private void frmOfferDetails_Load(object sender, EventArgs e)
        {
            LoadOrderDetails();
            LoadOfferItems();
            LoadProducts();
        }

        private async void LoadProducts()
        {
            var apiClient = await CreatePoseidonClient();

            var result = await apiClient.ApiProductQueryAsync(1, 200, null, "productId");

           
            drlProducts.DataSource =  result?.Items?.Select(
            s => new {
                s.ProductId,
                Details = $"{s.Number} -- {s.Name} -- {s.Price} -- {s.Unit}"
            }).ToArray(); 
            drlProducts.DisplayMember = "Details";
            drlProducts.ValueMember = "ProductId";
        }
        private async void LoadOrderDetails()
        {
            var apiClient = await CreatePoseidonClient();

            var result = await apiClient.ApiDiscountofferQueryAsync(1, 1000, $"discountOfferId={_discountOfferId}", null);

            _discountOffer = null;
            _discountOffer = result.Items?.FirstOrDefault();

            lblOfferNumber.Text          = "Offer number: " + _discountOffer?.DiscountOfferId.ToString();
            lblTitle.Text                = "Title: " + _discountOffer?.Title.Truncate(50);
            lblStartDate.Text            = $"Start date: {_discountOffer?.StartDate?.ToString("dd.MM.yyyy")}";
            lblEndDate.Text              = $"End date: {_discountOffer?.EndDate?.ToString("dd.MM.yyyy")}";
            lblDiscount.Text             = $"Discount: {_discountOffer?.Discount.ToString()}";
            lblDescription.Text          = $"Description: {_discountOffer?.Description}".Truncate(50);

        }
        private async void LoadOfferItems()
        {
            var apiClient = await CreatePoseidonClient();

            var result = await apiClient.ApiOfferProductsAsync(_discountOfferId, 1, 1000, null, "productId");

            offerDetailGrid.AutoGenerateColumns = false; 

            if(result?.Items is not null)
            {
                offerDetailGrid.DataSource = result.Items;
            }
        }

        private async void offerGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                var id = offerDetailGrid.Rows[e.RowIndex].Cells[0].Value;

                if (offerDetailGrid.Columns[e.ColumnIndex].Name == "Remove")
                {
                    if (long.TryParse(id.ToString(), out long outId))
                    {
                        var apiClient = await CreatePoseidonClient();
                        var discountProduct = await apiClient.ApiProductdiscountofferQueryAsync(1, 1, $"discountOfferId={_discountOfferId},productId={outId}", null);

                        var deleteId = discountProduct?.Items?.FirstOrDefault()?.ProductDiscountOfferId; 
                        if (deleteId is not null)
                        {
                            await apiClient.ApiDiscountofferDeleteAsync(deleteId!.Value);
                        }
                    }
                }
                LoadOfferItems();
            }
            catch (Exception)
            {

                return;
            }
        }

        private async void btnAddProduct_Click(object sender, EventArgs e)
        { 
            if(_productIdToAdd != 0)
            {
                var apiClient = await CreatePoseidonClient();

                await apiClient.ApiProductdiscountofferUpsertAsync(new()
                {
                    ProductId = _productIdToAdd,
                    DiscountOfferId = _discountOfferId
                });
            }
            _productIdToAdd = 0;
            LoadOfferItems();
        }

        private void drlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var selected  = drlProducts.SelectedValue as int?; 
                if (selected != null)
                {
                    _productIdToAdd = selected!.Value;
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}
