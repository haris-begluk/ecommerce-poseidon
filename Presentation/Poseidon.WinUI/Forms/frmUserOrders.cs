using Microsoft.Reporting.WinForms;

namespace Poseidon.WinUI.Forms
{
    public partial class frmUserOrders : Form
    {
        private DateTime _from; 
        private DateTime _until;
        public frmUserOrders()
        {
            InitializeComponent();
        }
        private async void LoadUsers()
        {

            var adminClient = await CreatePoseidonClient();
            var result = await adminClient.ApiUserQueryAsync(1, 1000, null, "userId");

            drlUsers.DataSource = result.Items;
            drlUsers.DisplayMember = "Username";
            drlUsers.ValueMember = "UserId"; 
        }
        private async void LoadReport()
        {
            var Id = long.Parse(drlUsers?.SelectedValue?.ToString() ?? "");           
            
            var apiClient = await CreatePoseidonClient();

            var filter = $"userId={Id}";

            if (_from < _until)
            {
                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",")
                    + $"sys_CreatedAt > {_from}";

                filter += (string.IsNullOrWhiteSpace(filter) ? "" : ",")
                    + $"sys_CreatedAt < {_until}";
            }

            var result = await apiClient.ApiOrderQueryAsync(1, 1000, filter , "sys_CreatedAt desc");

            var userResult = await apiClient.ApiUserQueryAsync(1, 2, $"userId={Id}", null);

            if (result.TotalCount < 1)
            {
                MessageBox.Show("User does not have any orders");
                return;
            }

            var user = userResult.Items?.FirstOrDefault();

            var parameters = new[]
            {
                new ReportParameter("Title", "User orders report"),
                new ReportParameter("From",  _from.ToString("yyyy-MM-dd")),
                new ReportParameter("Until", _until.ToString("yyyy-MM-dd")),
                new ReportParameter("Title", "User orders report"),
                new ReportParameter("User", $"User name: {user?.Username} First name: {user?.FirstName} Last name: {user?.LastName}")
               
            };
            var path = Directory.GetCurrentDirectory();
            using var fs = new FileStream($"{path}/../../../Reports/UserOrders.rdlc", FileMode.Open);

            reportViewer1.LocalReport.LoadReportDefinition(fs);

            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource(
                "DataSet1", result.Items
                ));
            reportViewer1.RefreshReport();
            reportViewer1.LocalReport.SetParameters(parameters);
        }

        private void frmUserOrders_Load(object sender, EventArgs e)
        {
            dtpOrderFrom.Value = _from = DateTime.Now.AddMonths(-1);
            dtpOrderUntil.Value = _until = DateTime.Now.AddDays(1);
            LoadUsers();
            
        }

        private void btnCreateReport_Click(object sender, EventArgs e)
        {
            LoadReport();
        }

        private void dtpOrderFrom_ValueChanged(object sender, EventArgs e)
        {
            _from  = dtpOrderFrom.Value;
        }

        private void dtpOrderUntil_ValueChanged(object sender, EventArgs e)
        {
            _until = dtpOrderUntil.Value;
        }
    }
}