namespace Poseidon.WinUI.Forms
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.menuStrip = new System.Windows.Forms.MenuStrip();
            this.usersMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ordersMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.productsMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.offersToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.userOrdersReportToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolTip = new System.Windows.Forms.ToolTip(this.components);
            this.menuStrip.SuspendLayout();
            this.statusStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip
            // 
            this.menuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.usersMenuItem,
            this.ordersMenuItem,
            this.productsMenuItem,
            this.offersToolStripMenuItem,
            this.userOrdersReportToolStripMenuItem});
            this.menuStrip.Location = new System.Drawing.Point(0, 0);
            this.menuStrip.Name = "menuStrip";
            this.menuStrip.Padding = new System.Windows.Forms.Padding(5, 2, 0, 2);
            this.menuStrip.Size = new System.Drawing.Size(1264, 24);
            this.menuStrip.TabIndex = 0;
            this.menuStrip.Text = "MenuStrip";
            // 
            // usersMenuItem
            // 
            this.usersMenuItem.Name = "usersMenuItem";
            this.usersMenuItem.Size = new System.Drawing.Size(47, 20);
            this.usersMenuItem.Text = "Users";
            this.usersMenuItem.Click += new System.EventHandler(this.ShowNewForm);
            // 
            // ordersMenuItem
            // 
            this.ordersMenuItem.Name = "ordersMenuItem";
            this.ordersMenuItem.Size = new System.Drawing.Size(54, 20);
            this.ordersMenuItem.Text = "Orders";
            this.ordersMenuItem.Click += new System.EventHandler(this.ordersMenuItem_Click);
            // 
            // productsMenuItem
            // 
            this.productsMenuItem.Name = "productsMenuItem";
            this.productsMenuItem.Size = new System.Drawing.Size(66, 20);
            this.productsMenuItem.Text = "Products";
            this.productsMenuItem.Click += new System.EventHandler(this.productsMenuItem_Click);
            // 
            // offersToolStripMenuItem
            // 
            this.offersToolStripMenuItem.Name = "offersToolStripMenuItem";
            this.offersToolStripMenuItem.Size = new System.Drawing.Size(51, 20);
            this.offersToolStripMenuItem.Text = "Offers";
            this.offersToolStripMenuItem.Click += new System.EventHandler(this.offersToolStripMenuItem_Click);
            // 
            // userOrdersReportToolStripMenuItem
            // 
            this.userOrdersReportToolStripMenuItem.Name = "userOrdersReportToolStripMenuItem";
            this.userOrdersReportToolStripMenuItem.Size = new System.Drawing.Size(113, 20);
            this.userOrdersReportToolStripMenuItem.Text = "User orders report";
            this.userOrdersReportToolStripMenuItem.Click += new System.EventHandler(this.userOrdersReportToolStripMenuItem_Click);
            // 
            // statusStrip
            // 
            this.statusStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel});
            this.statusStrip.Location = new System.Drawing.Point(0, 659);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Padding = new System.Windows.Forms.Padding(1, 0, 16, 0);
            this.statusStrip.Size = new System.Drawing.Size(1264, 22);
            this.statusStrip.TabIndex = 2;
            this.statusStrip.Text = "StatusStrip";
            // 
            // toolStripStatusLabel
            // 
            this.toolStripStatusLabel.Name = "toolStripStatusLabel";
            this.toolStripStatusLabel.Size = new System.Drawing.Size(39, 17);
            this.toolStripStatusLabel.Text = "Status";
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1264, 681);
            this.Controls.Add(this.statusStrip);
            this.Controls.Add(this.menuStrip);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip;
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmMain";
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.menuStrip.ResumeLayout(false);
            this.menuStrip.PerformLayout();
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion


        private System.Windows.Forms.MenuStrip menuStrip;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel;
        private System.Windows.Forms.ToolTip toolTip;
        private System.Windows.Forms.ToolStripMenuItem usersMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ordersMenuItem;
        private System.Windows.Forms.ToolStripMenuItem productsMenuItem;
        private ToolStripMenuItem offersToolStripMenuItem;
        private ToolStripMenuItem userOrdersReportToolStripMenuItem;
    }
}