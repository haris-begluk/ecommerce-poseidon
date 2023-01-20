namespace Poseidon.WinUI.Forms
{
    public partial class frmOrderGrid : Form
    {

        public frmOrderGrid()
        {
            InitializeComponent();
        }

        private async void LoadOrders(
              string search = ""
            , string orderby = ""
            , DateTimeOffset? from = null
            , DateTimeOffset? until = null)
        {
            
            var apiClient = await CreatePoseidonClient();

            var filter = string.IsNullOrWhiteSpace(search) 
                ? "" 
                : $"description=*{search}|sys_CreatedBy=*{search}";


            if(decimal.TryParse(search, out decimal outValue) && !string.IsNullOrWhiteSpace(search))
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : "|")
                    + $"orderTotal>={outValue},orderTotal<={++outValue}";
            }

           if(from is not null)
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",") 
                    + $"sys_CreatedAt > {from}"; 
                
            }

            if (until is not null)
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",") 
                    + $"sys_CreatedAt < {until}";

            }

            var result = await apiClient.ApiOrderQueryAsync(1, 1000, filter, orderby);
            
            orderGrid.AutoGenerateColumns = false;
            orderGrid.DataSource = result.Items;
        }

        private void frmOrderGrid_Load(object sender, EventArgs e)
        { 
            orderDateFrom.Value = DateTime.Now.AddMonths(-1);
            orderDateUntil.Value = DateTime.Now.AddMonths(1);
            LoadOrders();
        }

        private void orderGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                var orderId = orderGrid.Rows[e.RowIndex].Cells[0].Value;

                if (orderGrid.Columns[e.ColumnIndex].Name == "Details")
                {
                    if (long.TryParse(orderId.ToString(), out long outOrderId))
                    {
                        frmOrderDetails frm = new(outOrderId);
                        frm.ShowDialog();
                    }
                }
            }
            catch (Exception)
            {

                return;
            }
            
        }

        private void orderDateUntil_ValueChanged(object sender, EventArgs e)
        {
            LoadOrders(
                  search: txtOrderSearch.Text
                , orderby: "orderId"
                , from: orderDateFrom.Value
                , until: orderDateUntil.Value);
        }

        private void orderDateFrom_ValueChanged(object sender, EventArgs e)
        {
            LoadOrders(
                  search: txtOrderSearch.Text
                , orderby: "orderId"
                , from: orderDateFrom.Value
                , until: orderDateUntil.Value);
        }

        private void orderSearch_TextChanged(object sender, EventArgs e)
        {
            LoadOrders(
                  search:txtOrderSearch.Text
                , orderby: "orderId"
                , from: orderDateFrom.Value
                , until: orderDateUntil.Value);
        }
    }
}