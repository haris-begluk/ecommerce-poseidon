
namespace Poseidon.WinUI.Forms
{
    partial class frmUserOrders
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
            this.btnCreateReport = new System.Windows.Forms.Button();
            this.drlUsers = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.dtpOrderFrom = new System.Windows.Forms.DateTimePicker();
            this.dtpOrderUntil = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnCreateReport
            // 
            this.btnCreateReport.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnCreateReport.Location = new System.Drawing.Point(996, 17);
            this.btnCreateReport.Margin = new System.Windows.Forms.Padding(2);
            this.btnCreateReport.Name = "btnCreateReport";
            this.btnCreateReport.Size = new System.Drawing.Size(159, 33);
            this.btnCreateReport.TabIndex = 3;
            this.btnCreateReport.Text = "Create report";
            this.btnCreateReport.UseVisualStyleBackColor = true;
            this.btnCreateReport.Click += new System.EventHandler(this.btnCreateReport_Click);
            // 
            // drlUsers
            // 
            this.drlUsers.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.drlUsers.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.drlUsers.FormattingEnabled = true;
            this.drlUsers.Location = new System.Drawing.Point(69, 17);
            this.drlUsers.Margin = new System.Windows.Forms.Padding(2);
            this.drlUsers.Name = "drlUsers";
            this.drlUsers.Size = new System.Drawing.Size(170, 24);
            this.drlUsers.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 24);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 15);
            this.label1.TabIndex = 5;
            this.label1.Text = "User";
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.reportViewer1.Location = new System.Drawing.Point(0, 81);
            this.reportViewer1.Name = "ReportViewer";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(1184, 560);
            this.reportViewer1.TabIndex = 0;
            // 
            // dtpOrderFrom
            // 
            this.dtpOrderFrom.Location = new System.Drawing.Point(417, 20);
            this.dtpOrderFrom.Name = "dtpOrderFrom";
            this.dtpOrderFrom.Size = new System.Drawing.Size(200, 23);
            this.dtpOrderFrom.TabIndex = 6;
            this.dtpOrderFrom.ValueChanged += new System.EventHandler(this.dtpOrderFrom_ValueChanged);
            // 
            // dtpOrderUntil
            // 
            this.dtpOrderUntil.Location = new System.Drawing.Point(703, 20);
            this.dtpOrderUntil.Name = "dtpOrderUntil";
            this.dtpOrderUntil.Size = new System.Drawing.Size(200, 23);
            this.dtpOrderUntil.TabIndex = 7;
            this.dtpOrderUntil.ValueChanged += new System.EventHandler(this.dtpOrderUntil_ValueChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(376, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 15);
            this.label2.TabIndex = 8;
            this.label2.Text = "From";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(665, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 15);
            this.label3.TabIndex = 9;
            this.label3.Text = "Until";
            // 
            // frmUserOrders
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1184, 641);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dtpOrderUntil);
            this.Controls.Add(this.dtpOrderFrom);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.drlUsers);
            this.Controls.Add(this.btnCreateReport);
            this.Controls.Add(this.reportViewer1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "frmUserOrders";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "User Orders";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmUserOrders_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCreateReport;
        private System.Windows.Forms.ComboBox drlUsers;
        private System.Windows.Forms.Label label1;
        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private DateTimePicker dtpOrderFrom;
        private DateTimePicker dtpOrderUntil;
        private Label label2;
        private Label label3;
    }
}