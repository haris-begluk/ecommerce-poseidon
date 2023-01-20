
namespace Poseidon.WinUI.Forms
{
    partial class frmOrderGrid
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.orderGrid = new System.Windows.Forms.DataGridView();
            this.orderDateFrom = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.orderDateUntil = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.txtOrderSearch = new System.Windows.Forms.TextBox();
            this.OrderId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.OrderTotal = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewCheckBoxColumn1 = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Sys_CreatedBy = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Sys_CreatedAt = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SubTotal = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductTaxAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductDiscountAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.OrderDiscountAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.OrderTaxAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ShippingMethod = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ShippingFeeAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PaymentMethod = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PaymentFeeAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Details = new System.Windows.Forms.DataGridViewButtonColumn();
            ((System.ComponentModel.ISupportInitialize)(this.orderGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // orderGrid
            // 
            this.orderGrid.AllowUserToAddRows = false;
            this.orderGrid.AllowUserToDeleteRows = false;
            this.orderGrid.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.orderGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.orderGrid.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.orderGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.orderGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.OrderId,
            this.Description,
            this.OrderTotal,
            this.dataGridViewCheckBoxColumn1,
            this.Sys_CreatedBy,
            this.Sys_CreatedAt,
            this.SubTotal,
            this.ProductTaxAmount,
            this.ProductDiscountAmount,
            this.OrderDiscountAmount,
            this.OrderTaxAmount,
            this.ShippingMethod,
            this.ShippingFeeAmount,
            this.PaymentMethod,
            this.PaymentFeeAmount,
            this.Details});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.orderGrid.DefaultCellStyle = dataGridViewCellStyle2;
            this.orderGrid.Location = new System.Drawing.Point(32, 99);
            this.orderGrid.Name = "orderGrid";
            this.orderGrid.ReadOnly = true;
            this.orderGrid.RowHeadersWidth = 51;
            this.orderGrid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.orderGrid.Size = new System.Drawing.Size(1123, 530);
            this.orderGrid.TabIndex = 0;
            this.orderGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.orderGrid_CellContentClick);
            // 
            // orderDateFrom
            // 
            this.orderDateFrom.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.orderDateFrom.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.orderDateFrom.Location = new System.Drawing.Point(32, 54);
            this.orderDateFrom.Name = "orderDateFrom";
            this.orderDateFrom.Size = new System.Drawing.Size(193, 23);
            this.orderDateFrom.TabIndex = 1;
            this.orderDateFrom.ValueChanged += new System.EventHandler(this.orderDateFrom_ValueChanged);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 15);
            this.label1.TabIndex = 2;
            this.label1.Text = "From";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(486, 36);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(42, 15);
            this.label2.TabIndex = 4;
            this.label2.Text = "Search";
            // 
            // orderDateUntil
            // 
            this.orderDateUntil.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.orderDateUntil.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.orderDateUntil.Location = new System.Drawing.Point(269, 54);
            this.orderDateUntil.Name = "orderDateUntil";
            this.orderDateUntil.Size = new System.Drawing.Size(193, 23);
            this.orderDateUntil.TabIndex = 5;
            this.orderDateUntil.ValueChanged += new System.EventHandler(this.orderDateUntil_ValueChanged);
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(269, 36);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 15);
            this.label3.TabIndex = 6;
            this.label3.Text = "Until";
            // 
            // txtOrderSearch
            // 
            this.txtOrderSearch.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txtOrderSearch.Location = new System.Drawing.Point(486, 54);
            this.txtOrderSearch.Name = "txtOrderSearch";
            this.txtOrderSearch.Size = new System.Drawing.Size(204, 23);
            this.txtOrderSearch.TabIndex = 7;
            this.txtOrderSearch.TextChanged += new System.EventHandler(this.orderSearch_TextChanged);
            // 
            // OrderId
            // 
            this.OrderId.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.OrderId.DataPropertyName = "OrderId";
            this.OrderId.FillWeight = 53.47594F;
            this.OrderId.HeaderText = "Order Number";
            this.OrderId.MinimumWidth = 6;
            this.OrderId.Name = "OrderId";
            this.OrderId.ReadOnly = true;
            // 
            // Description
            // 
            this.Description.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.Description.DataPropertyName = "Description";
            this.Description.FillWeight = 111.631F;
            this.Description.HeaderText = "Description";
            this.Description.MinimumWidth = 6;
            this.Description.Name = "Description";
            this.Description.ReadOnly = true;
            this.Description.Width = 85;
            // 
            // OrderTotal
            // 
            this.OrderTotal.DataPropertyName = "OrderTotal";
            this.OrderTotal.HeaderText = "Total";
            this.OrderTotal.Name = "OrderTotal";
            this.OrderTotal.ReadOnly = true;
            // 
            // dataGridViewCheckBoxColumn1
            // 
            this.dataGridViewCheckBoxColumn1.DataPropertyName = "PayedAndClosed";
            this.dataGridViewCheckBoxColumn1.HeaderText = "Closed";
            this.dataGridViewCheckBoxColumn1.Name = "dataGridViewCheckBoxColumn1";
            this.dataGridViewCheckBoxColumn1.ReadOnly = true;
            // 
            // Sys_CreatedBy
            // 
            this.Sys_CreatedBy.DataPropertyName = "Sys_CreatedBy";
            this.Sys_CreatedBy.HeaderText = "Created by";
            this.Sys_CreatedBy.MinimumWidth = 6;
            this.Sys_CreatedBy.Name = "Sys_CreatedBy";
            this.Sys_CreatedBy.ReadOnly = true;
            this.Sys_CreatedBy.Visible = false;
            // 
            // Sys_CreatedAt
            // 
            this.Sys_CreatedAt.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Sys_CreatedAt.DataPropertyName = "Sys_CreatedAt";
            this.Sys_CreatedAt.FillWeight = 111.631F;
            this.Sys_CreatedAt.HeaderText = "Created Date";
            this.Sys_CreatedAt.MinimumWidth = 6;
            this.Sys_CreatedAt.Name = "Sys_CreatedAt";
            this.Sys_CreatedAt.ReadOnly = true;
            // 
            // SubTotal
            // 
            this.SubTotal.DataPropertyName = "SubTotal";
            this.SubTotal.HeaderText = "Sub Total";
            this.SubTotal.Name = "SubTotal";
            this.SubTotal.ReadOnly = true;
            // 
            // ProductTaxAmount
            // 
            this.ProductTaxAmount.DataPropertyName = "ProductTaxAmount";
            this.ProductTaxAmount.HeaderText = "Product Tax Amount";
            this.ProductTaxAmount.Name = "ProductTaxAmount";
            this.ProductTaxAmount.ReadOnly = true;
            // 
            // ProductDiscountAmount
            // 
            this.ProductDiscountAmount.DataPropertyName = "ProductDiscountAmount";
            this.ProductDiscountAmount.HeaderText = "Product Discount";
            this.ProductDiscountAmount.Name = "ProductDiscountAmount";
            this.ProductDiscountAmount.ReadOnly = true;
            // 
            // OrderDiscountAmount
            // 
            this.OrderDiscountAmount.DataPropertyName = "OrderDiscountAmount";
            this.OrderDiscountAmount.HeaderText = "Order Discount";
            this.OrderDiscountAmount.Name = "OrderDiscountAmount";
            this.OrderDiscountAmount.ReadOnly = true;
            // 
            // OrderTaxAmount
            // 
            this.OrderTaxAmount.DataPropertyName = "OrderTaxAmount";
            this.OrderTaxAmount.HeaderText = "Order Tax";
            this.OrderTaxAmount.Name = "OrderTaxAmount";
            this.OrderTaxAmount.ReadOnly = true;
            // 
            // ShippingMethod
            // 
            this.ShippingMethod.DataPropertyName = "ShippingMethod";
            this.ShippingMethod.HeaderText = "Shipping Method";
            this.ShippingMethod.Name = "ShippingMethod";
            this.ShippingMethod.ReadOnly = true;
            // 
            // ShippingFeeAmount
            // 
            this.ShippingFeeAmount.DataPropertyName = "ShippingFeeAmount";
            this.ShippingFeeAmount.HeaderText = "Shipping Fee";
            this.ShippingFeeAmount.Name = "ShippingFeeAmount";
            this.ShippingFeeAmount.ReadOnly = true;
            // 
            // PaymentMethod
            // 
            this.PaymentMethod.DataPropertyName = "PaymentMethod";
            this.PaymentMethod.HeaderText = "Payment Method";
            this.PaymentMethod.Name = "PaymentMethod";
            this.PaymentMethod.ReadOnly = true;
            // 
            // PaymentFeeAmount
            // 
            this.PaymentFeeAmount.DataPropertyName = "PaymentFeeAmount";
            this.PaymentFeeAmount.HeaderText = "Payment Fee";
            this.PaymentFeeAmount.Name = "PaymentFeeAmount";
            this.PaymentFeeAmount.ReadOnly = true;
            // 
            // Details
            // 
            this.Details.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Details.FillWeight = 111.631F;
            this.Details.HeaderText = "Details";
            this.Details.MinimumWidth = 6;
            this.Details.Name = "Details";
            this.Details.ReadOnly = true;
            this.Details.Text = "Details";
            this.Details.UseColumnTextForButtonValue = true;
            // 
            // frmOrderGrid
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(1184, 641);
            this.Controls.Add(this.txtOrderSearch);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.orderDateUntil);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.orderDateFrom);
            this.Controls.Add(this.orderGrid);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmOrderGrid";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Orders";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmOrderGrid_Load);
            ((System.ComponentModel.ISupportInitialize)(this.orderGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView orderGrid;
        private System.Windows.Forms.DateTimePicker orderDateFrom;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private DateTimePicker orderDateUntil;
        private Label label3;
        private TextBox txtOrderSearch;
        private DataGridViewTextBoxColumn OrderId;
        private DataGridViewTextBoxColumn Description;
        private DataGridViewTextBoxColumn OrderTotal;
        private DataGridViewCheckBoxColumn dataGridViewCheckBoxColumn1;
        private DataGridViewTextBoxColumn Sys_CreatedBy;
        private DataGridViewTextBoxColumn Sys_CreatedAt;
        private DataGridViewTextBoxColumn SubTotal;
        private DataGridViewTextBoxColumn ProductTaxAmount;
        private DataGridViewTextBoxColumn ProductDiscountAmount;
        private DataGridViewTextBoxColumn OrderDiscountAmount;
        private DataGridViewTextBoxColumn OrderTaxAmount;
        private DataGridViewTextBoxColumn ShippingMethod;
        private DataGridViewTextBoxColumn ShippingFeeAmount;
        private DataGridViewTextBoxColumn PaymentMethod;
        private DataGridViewTextBoxColumn PaymentFeeAmount;
        private DataGridViewButtonColumn Details;
    }
}