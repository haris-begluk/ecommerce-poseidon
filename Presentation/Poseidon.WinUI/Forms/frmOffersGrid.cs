namespace Poseidon.WinUI.Forms
{
    public partial class frmOfferGrid : Form
    {
        private int _selectedOffer = 0;
      
        public frmOfferGrid()
        {
            InitializeComponent();
        }

        private async void LoadOffers(
               string search = ""
             , string orderby = ""
             , DateTimeOffset? from = null
             , DateTimeOffset? until = null
            )
        {

            var apiClient = await CreatePoseidonClient();

            var filter = string.IsNullOrWhiteSpace(search)
                ? ""
                : $"title=*{search}|description=*{search}|sys_CreatedBy=*{search}";


            if (decimal.TryParse(search, out decimal outValue) && !string.IsNullOrWhiteSpace(search))
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : "|")
                    + $"discount>={outValue},discount<={++outValue}";
            }

            if (from is not null)
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",")
                    + $"startDate > {from}";

            }

            if (until is not null)
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",")
                    + $"endDate < {until}";

            }

            var result = await apiClient.ApiDiscountofferQueryAsync(1, 400, filter, orderby);

            offerGrid.AutoGenerateColumns = false;
            offerGrid.DataSource = result.Items;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void dateFrom_ValueChanged(object sender, EventArgs e)
        {
            LoadOffers(
                 search: txtOfferSearch.Text
               , orderby: "sys_UpdatedAt desc"
               , from:  dateFrom.Value
               , until: dateUntil.Value);
        }

        private void dateUntil_ValueChanged(object sender, EventArgs e)
        {
            LoadOffers(
                 search: txtOfferSearch.Text
               , orderby: "sys_UpdatedAt desc"
               , from: dateFrom.Value
               , until: dateUntil.Value);
        }

        private void txtOfferSearch_TextChanged(object sender, EventArgs e)
        {
            LoadOffers(
                 search: txtOfferSearch.Text
               , orderby: "sys_UpdatedAt desc"
               , from: dateFrom.Value
               , until: dateUntil.Value);
        }

        private void btnOfferDetails_Click(object sender, EventArgs e)
        {
                
                frmOfferAdd frm = _selectedOffer == 0 ? new( null): new(_selectedOffer, true);
                frm.ShowDialog();
        }

        private void offerGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                var offerId = offerGrid.Rows[e.RowIndex].Cells[0].Value;

                if (offerGrid.Columns[e.ColumnIndex].Name == "Edit")
                {
                    if (int.TryParse(offerId.ToString(), out int outId))
                    {
                         frmOfferDetail frm = new(outId);
                         frm.ShowDialog();
                    }
                }

                if (int.TryParse(offerId.ToString(), out int selectedId))
                {
                    _selectedOffer = selectedId;
                }
            }
            catch (Exception)
            {
                return;
            }
        }

        private void frmOfferGrid_Load(object sender, EventArgs e)
        {
            dateFrom.Value = DateTime.Now.AddMonths(-1);
            dateUntil.Value = DateTime.Now.AddMonths(1);
            LoadOffers(orderby: "sys_UpdatedAt desc");
        }

        private void btnReloadOffers_Click(object sender, EventArgs e)
        {
            LoadOffers(orderby: "sys_UpdatedAt desc");
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmOfferAdd frm = new(null);
            frm.ShowDialog();
        }
    }
}
