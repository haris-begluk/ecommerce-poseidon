using Swagger.Poseidon;

namespace Poseidon.WinUI.Forms
{
    public partial class frmUserEdit : Form
    {

        private readonly string _userId;

        public frmUserEdit(string userId)
        {
            _userId = userId;
            InitializeComponent();
        }

        
        private bool ValidateUserInput()
        {
            errorProvider1.Clear();

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
            

            return true;
        }


        private async void btnEditUser_Click(object sender, EventArgs e)
        {
            if (!ValidateUserInput())
                return;

            var apiClient = await CreatePoseidonClient();
            
            var command = new UserCommand
            { 
                UserId = Convert.ToInt32(_userId),
                Email = txtEmail.Text,
                PhoneNumber = txtPhoneNumber.Text,
                FirstName = txtFirstname.Text,
                LastName = txtLastname.Text,

            };
            await apiClient.ApiUserUpsertAsync(command);

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private async void frmUserEdit_Load(object sender, EventArgs e)
        {

            var apiClient = await CreatePoseidonClient();

            var apiResult = await  apiClient.ApiUserQueryAsync(1, 2, $"userId={_userId}", null);

            var  apiUser = apiResult.Items?.FirstOrDefault();

            if (apiUser is null)
            {
                this.Close();
            }

            txtEmail.Text       = apiUser?.Email;
            txtPhoneNumber.Text = apiUser?.PhoneNumber; 
            txtUsername.Text    = apiUser?.Username; 
            txtFirstname.Text   = apiUser?.FirstName;
            txtLastname.Text    = apiUser?.LastName;
        }
    }
}