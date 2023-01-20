using Swagger.Poseidon;

namespace Poseidon.WinUI.Forms
{
    public partial class frmProductAdd : Form
    {

        private int? _productId;

        public frmProductAdd(int? productId)
        {
            InitializeComponent();
            _productId = productId;
        }
        private bool Validacija()
        {
            errorProvider1.Clear();

            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                errorProvider1.SetError(txtName, "Name is required");
                return false;
            }
            else if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                errorProvider1.SetError(txtDescription, "Description is required");
                return false;
            }
            else 
            if (txtPrice.Value == 0)
            {
                errorProvider1.SetError(txtPrice, "Price can't have value 0");
                return false;
            }else 
            if (Convert.ToInt32(drlCategories.SelectedValue) == 0)
            {
                errorProvider1.SetError(drlCategories, "Invalid category for product. Select valid category.");
                return false;
            }

            return true;
        }

        private async void LoadEditMode()
        {

            if (_productId is not null)
            {
                var apiClient = await CreatePoseidonClient();

                var result = await apiClient.ApiProductQueryAsync(1, 2, $"productId={_productId}", null);
                var product = result.Items?.FirstOrDefault();
                if (product is not null)
                {
                    txtDescription.Text         = product.Description;
                    txtName.Text                = product.Name;
                    txtPrice.Value              = product.Price ?? 0;
                    txtProductGtin.Text         = product.Gtin ?? String.Empty; 
                    txtProductNumber.Text       = product.Number ?? String.Empty; 
                    txtProductUnit.Text         = product.Unit ?? String.Empty;
                    drlCategories.SelectedValue = product.CategoryId ?? 1;
                }
                else
                {
                    _productId = null;
                }

            }

        }

        private void frmProductAdd_Load(object sender, EventArgs e)
        { 
            LoadCategories();
            LoadEditMode();
        }

        private void btnProductAdd_Click(object sender, EventArgs e)
        {
            UpsertProduct();
        } 
        private async void UpsertProduct()
        {
            if (!Validacija())
                return;

            var apiClient = await CreatePoseidonClient();

            ProductCommand product = new()
            {  
                ProductId   = _productId,
                Name        = txtName.Text,
                Description = txtDescription.Text,
                Price       = txtPrice.Value, 
                Number      = txtProductNumber.Text,
                Unit        = txtProductUnit.Text,
                Gtin        = txtProductGtin.Text,
                CategoryId  = Convert.ToInt32(drlCategories.SelectedValue) == 0 
                            ? 1 
                            : Convert.ToInt32(drlCategories.SelectedValue)
            };

            await apiClient.ApiProductUpsertAsync(product);

            this.Close();
        }

        private async void LoadCategories()
        {
           
            var apiClient = await  CreatePoseidonClient();

            var result = await apiClient.ApiCategoryQueryAsync(1, 1000, null, "categoryId");

            var withDefault = new List<CategoryDto>() {
                new CategoryDto()
                {
                        CategoryId = 0,
                        Name="Default"
                }
            };

            withDefault.AddRange(result.Items!);

            drlCategories.DataSource = withDefault;
            drlCategories.DisplayMember = "Name";
            drlCategories.ValueMember = "CategoryId";
        }
    }
}
