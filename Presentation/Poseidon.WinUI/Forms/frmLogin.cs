using Poseidon.WinUI.Forms;
using static Poseidon.WinUI.Auth.AuthService;
namespace Poseidon.WinUI
{
    public partial class frmLogin : Form
    {


        public frmLogin()
        {
            InitializeComponent();

        }
        private async void loginBtn_Click(object sender, EventArgs e)
        {
            await Login();
          
#if DEBUG
            //MessageBox.Show(this, result, "Login", MessageBoxButtons.OK, MessageBoxIcon.Information);
#endif
            if (IsValid())
            {
                var _page = new frmMain();
                _page.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show(this, "Login failed please try again", "Login", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void Main_Load(object sender, EventArgs e)
        {

        }
    }
}
