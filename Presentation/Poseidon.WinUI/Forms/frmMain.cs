namespace Poseidon.WinUI.Forms
{
    public partial class frmMain : Form
    {
            private int childFormNumber = 0;

            public frmMain()
            {
                InitializeComponent();
                this.Width = MainFormWidth; 
                this.Height = MainFormHeight;
            }

            private void ShowNewForm(object sender, EventArgs e)
            {
                Form childForm = new frmUserGrid()
                {
                    MdiParent = this,
                    Text = "Window " + childFormNumber++
                };
                childForm.Show();
            }

            private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
            {
                this.Close();
            }

            private void CascadeToolStripMenuItem_Click(object sender, EventArgs e)
            {
                LayoutMdi(MdiLayout.Cascade);
            }

            private void TileVerticalToolStripMenuItem_Click(object sender, EventArgs e)
            {
                LayoutMdi(MdiLayout.TileVertical);
            }

            private void TileHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
            {
                LayoutMdi(MdiLayout.TileHorizontal);
            }

            private void ArrangeIconsToolStripMenuItem_Click(object sender, EventArgs e)
            {
                LayoutMdi(MdiLayout.ArrangeIcons);
            }

            private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
            {
                foreach (Form childForm in MdiChildren)
                {
                    childForm.Close();
                }
            }

        private void ordersMenuItem_Click(object sender, EventArgs e)
        {
            frmOrderGrid frm = new ();
            frm.MdiParent = this;
            frm.Show();
        }

        private void productsMenuItem_Click(object sender, EventArgs e)
        {
            frmProductGrid frm = new ();
            frm.MdiParent = this;
            frm.Show();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            frmUserGrid frm = new();
            frm.MdiParent = this; 
            frm.Show();
        }

        private void offersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmOfferGrid frm = new();
            frm.MdiParent = this;
            frm.Show();
        }

        private void userOrdersReportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUserOrders frm = new();
            frm.MdiParent = this;
            frm.Show();
        }
    }
}
