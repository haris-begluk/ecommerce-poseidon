namespace Poseidon.WinUI.Forms
{
    public partial class frmUserGrid : Form
    {

        public frmUserGrid()
        {
            InitializeComponent();
        }

        private async void LoadUsers(string search = "", string orderby = "")
        {

            var apiClient = await CreatePoseidonClient();

            var filter = string.IsNullOrEmpty(search) ? "" : $"email=*{search}|username=*{search}";

            var result = await apiClient.ApiUserQueryAsync(1, 1000, filter , orderby);
            userGrid.AutoGenerateColumns = false;
            userGrid.DataSource = result.Items;
        }

        private void frmUsersGrid_Load(object sender, EventArgs e)
        {
             LoadUsers();
        }

        private void btnUserAdd_Click(object sender, EventArgs e)
        {
            frmUserAdd frm = new ();
            if (frm.ShowDialog() == DialogResult.OK)
                LoadUsers();
        }

        private void txbxSearch_TextChanged(object sender, EventArgs e)
        { 
            LoadUsers(search: txtSearch.Text,orderby: "userName");
        }

        private void userGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (userGrid.Columns[e.ColumnIndex].Name == "Edit")
            {
                var id = userGrid.Rows[e.RowIndex].Cells["UserId"].Value.ToString();
                frmUserEdit frm = new (id ?? "<NULL>");
                if (frm.ShowDialog() == DialogResult.OK)
                LoadUsers();
            }
        }
    }
}
