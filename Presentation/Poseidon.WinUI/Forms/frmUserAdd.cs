using Swagger.Poseidon;

namespace Poseidon.WinUI.Forms
{
    public partial class frmUserAdd : Form
    {

        public frmUserAdd()
        {
            InitializeComponent();
        }
        private async Task<bool> ValidateUserInput()
        {
            errorProvider1.Clear();

            if(string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                errorProvider1.SetError(txtUsername, "Username is required");
                return false;
            }else
            if (string.IsNullOrWhiteSpace(txtFirstname.Text))
            {
                errorProvider1.SetError(txtFirstname, "First name is required");
                return false;
            }
            else if (string.IsNullOrWhiteSpace(txtLastname.Text))
            {
                errorProvider1.SetError(txtLastname, "Last name is required");
                return false;
            }
            else 
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                errorProvider1.SetError(txtEmail, "Email is required");
                return false;
            }
            else 
            if (string.IsNullOrWhiteSpace(txtPhoneNumber.Text))
            {
                errorProvider1.SetError(txtPhoneNumber, "Phone number is required");
                return false;
            }

            var apiClient = await CreatePoseidonClient();

            var existing = await apiClient.ApiUserQueryAsync(1, 2, $"userName={txtUsername.Text}", null);

            if(existing.TotalCount > 0)
            {
                errorProvider1.SetError(txtUsername, $"Username must be uniq, {txtUsername.Text} is taken");
                return false;
            }

            return true;
        }

        private async void btnAddUser_Click(object sender, EventArgs e)
        {
            if (!await ValidateUserInput())
                return;
            var adminClient = await CreateAdminClient();

            var apiClient = await CreatePoseidonClient();

            string? userId = null;
            try
            {
                userId = await adminClient.ApiUserSignupAsync(new ()
                {
                    Email = txtEmail.Text,
                    UserName = txtUsername.Text,
                    PhoneNumber = txtPhoneNumber.Text,
                });
           

                if (!string.IsNullOrWhiteSpace(userId))
                {
                    var id = userId.Replace("\"", "");
                    var apiResult = await apiClient.ApiUserQueryAsync(1, 2, null, $"username={txtUsername.Text}");

                    var command = new UserCommand
                    {   
                        PhoneNumber = txtPhoneNumber.Text,
                        FirstName = txtFirstname.Text,
                        LastName = txtLastname.Text, 
                    };

                    if (apiResult.TotalCount == 1)
                    {
                        command = new UserCommand
                        {
                            UserId = apiResult!.Items!.First().UserId
                        };
                    }
                    else
                    {
                        return;
                    }

                    await apiClient.ApiUserUpsertAsync(command);
                }

            }
            catch
            { 
                return;
            }
            this.DialogResult = DialogResult.OK;
            this.Close();
        }
    }
}