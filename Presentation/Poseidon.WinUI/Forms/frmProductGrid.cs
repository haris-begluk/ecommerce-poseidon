using Swagger.Poseidon;
namespace Poseidon.WinUI.Forms
{
    public partial class frmProductGrid : Form
    {

      
        public frmProductGrid()
        {
            InitializeComponent();
        }


        private void frmProductGrid_Load(object sender, EventArgs e)
        {
            LoadCategories();
            LoadProducts();
        }
        private async void LoadCategories()
        {
            var apiClient = await CreatePoseidonClient();

            var result = await apiClient.ApiCategoryQueryAsync(1, 1000, null , "categoryId");

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
        private async void LoadProducts(
               string search = ""
             , string orderby = "" 
             , string category = ""
            )
        {

            var apiClient = await CreatePoseidonClient();

            var filter = string.IsNullOrWhiteSpace(search)
                ? ""
                : $"name=*{search}|gtin=*{search}|number=*{search}|description=*{search}|sys_CreatedBy=*{search}";


            if (decimal.TryParse(search, out decimal outValue) && !string.IsNullOrWhiteSpace(search))
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : "|")
                    + $"price>={outValue},price<={++outValue}";
            }

            if (!string.IsNullOrWhiteSpace(category) && !category.Equals("0"))
            {
                if (!string.IsNullOrWhiteSpace(filter))
                {
                     filter = "(" + filter + ")";

                }

                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",")
                + $"categoryId={category}";
            }

            var result = await apiClient.ApiProductQueryAsync(1, 400, filter, orderby);

            productGrid.AutoGenerateColumns = false;
            productGrid.DataSource = result.Items;
        }
        private void drlCategories_SelectedIndexChangedAsync(object sender, EventArgs e)
        {
            var selected = drlCategories.SelectedValue as int?;
            
            LoadProducts(search: txtProductSearch.Text, orderby: "productId"
                , category: selected is null || selected == 0 
                ? "" 
                : selected.ToString() ?? "");
        }

       
        private void productGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            ExecAction(e);
        }

        private void txtProductSearch_TextChangedAsync(object sender, EventArgs e)
        {
            var selected = drlCategories.SelectedValue as int?;
            LoadProducts(search: txtProductSearch.Text, orderby: "productId"
                , category: selected is null || selected == 0 ? "" : selected.ToString() ?? "");
        }

        private void btnAddProduct_Click(object sender, EventArgs e)
        {
            frmProductAdd frm = new(null);
            frm.Show();
        } 

        private async void ExecAction(DataGridViewCellEventArgs e)
        {
            var selected = drlCategories.SelectedValue as int?;

            if (productGrid.Columns[e.ColumnIndex].Name == "Edit")
            {
                var productId = int.Parse(productGrid?.Rows[e.RowIndex]?.Cells["ProductId"]?.Value?.ToString() ?? "");
                frmProductAdd frm = new(productId);
                if (frm.ShowDialog() == DialogResult.OK)
                LoadProducts(search: txtProductSearch.Text, orderby: "productId"
                , category: selected is null || selected == 0 ? "" : selected!.ToString()!);
            }

            if (productGrid?.Columns[e.ColumnIndex].Name == "Delete")
            {
                var id = int.Parse(productGrid.Rows[e.RowIndex].Cells["ProductId"].Value.ToString() ?? "");

                var apiClient = await CreatePoseidonClient();
                try
                {
                    await apiClient.ApiProductDeleteAsync(id);
                }
                catch
                {
                    
                        MessageBox.Show("System is not able to delete the product (product is in use)");
                    
                }
                

                LoadProducts(search: txtProductSearch.Text, orderby: "productId"
                , category: selected is null || selected == 0 ? "" : selected.ToString() ?? "");
            }
        }
    }
}
