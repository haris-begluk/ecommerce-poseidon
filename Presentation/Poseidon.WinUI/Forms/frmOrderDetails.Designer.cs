
namespace Poseidon.WinUI.Forms
{
    partial class frmOrderDetails
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
            this.lblOrderNumber = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblKlijentImePrezime = new System.Windows.Forms.Label();
            this.lblOrderDate = new System.Windows.Forms.Label();
            this.lblDatumNarudzbe = new System.Windows.Forms.Label();
            this.lblPayedClosed = new System.Windows.Forms.Label();
            this.lblStatusNarudzbe = new System.Windows.Forms.Label();
            this.orderItemsGrid = new System.Windows.Forms.DataGridView();
            this.label6 = new System.Windows.Forms.Label();
            this.lblOrderDiscount = new System.Windows.Forms.Label();
            this.lblOrderTaxAmount = new System.Windows.Forms.Label();
            this.lblShippingFee = new System.Windows.Forms.Label();
            this.lblPaymentFee = new System.Windows.Forms.Label();
            this.lblOrderTotal = new System.Windows.Forms.Label();
            this.lblPaymentMethod = new System.Windows.Forms.Label();
            this.lblUser = new System.Windows.Forms.Label();
            this.lblShippingMethod = new System.Windows.Forms.Label();
            this.lblProductDiscount = new System.Windows.Forms.Label();
            this.lblProductTaxAmount = new System.Windows.Forms.Label();
            this.lblSubTotal = new System.Windows.Forms.Label();
            this.lblStatus = new System.Windows.Forms.Label();
            this.lblDescription = new System.Windows.Forms.Label();
            this.ProductName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductPrice = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiscountAmount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.orderItemsGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // lblOrderNumber
            // 
            this.lblOrderNumber.AutoSize = true;
            this.lblOrderNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lblOrderNumber.Location = new System.Drawing.Point(20, 22);
            this.lblOrderNumber.Name = "lblOrderNumber";
            this.lblOrderNumber.Size = new System.Drawing.Size(85, 13);
            this.lblOrderNumber.TabIndex = 0;
            this.lblOrderNumber.Text = "Order Number";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(88, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 13);
            this.label2.TabIndex = 3;
            // 
            // lblKlijentImePrezime
            // 
            this.lblKlijentImePrezime.AutoSize = true;
            this.lblKlijentImePrezime.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lblKlijentImePrezime.Location = new System.Drawing.Point(50, 40);
            this.lblKlijentImePrezime.Name = "lblKlijentImePrezime";
            this.lblKlijentImePrezime.Size = new System.Drawing.Size(0, 13);
            this.lblKlijentImePrezime.TabIndex = 4;
            // 
            // lblOrderDate
            // 
            this.lblOrderDate.AutoSize = true;
            this.lblOrderDate.Location = new System.Drawing.Point(20, 81);
            this.lblOrderDate.Name = "lblOrderDate";
            this.lblOrderDate.Size = new System.Drawing.Size(63, 15);
            this.lblOrderDate.TabIndex = 5;
            this.lblOrderDate.Text = "Order date";
            // 
            // lblDatumNarudzbe
            // 
            this.lblDatumNarudzbe.AutoSize = true;
            this.lblDatumNarudzbe.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lblDatumNarudzbe.Location = new System.Drawing.Point(452, 8);
            this.lblDatumNarudzbe.Name = "lblDatumNarudzbe";
            this.lblDatumNarudzbe.Size = new System.Drawing.Size(0, 13);
            this.lblDatumNarudzbe.TabIndex = 6;
            // 
            // lblPayedClosed
            // 
            this.lblPayedClosed.AutoSize = true;
            this.lblPayedClosed.Location = new System.Drawing.Point(20, 109);
            this.lblPayedClosed.Name = "lblPayedClosed";
            this.lblPayedClosed.Size = new System.Drawing.Size(86, 15);
            this.lblPayedClosed.TabIndex = 7;
            this.lblPayedClosed.Text = "Closed (Payed)";
            // 
            // lblStatusNarudzbe
            // 
            this.lblStatusNarudzbe.AutoSize = true;
            this.lblStatusNarudzbe.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lblStatusNarudzbe.Location = new System.Drawing.Point(452, 40);
            this.lblStatusNarudzbe.Name = "lblStatusNarudzbe";
            this.lblStatusNarudzbe.Size = new System.Drawing.Size(0, 13);
            this.lblStatusNarudzbe.TabIndex = 8;
            // 
            // orderItemsGrid
            // 
            this.orderItemsGrid.AllowUserToAddRows = false;
            this.orderItemsGrid.AllowUserToDeleteRows = false;
            this.orderItemsGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.orderItemsGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ProductName,
            this.ProductPrice,
            this.Quantity,
            this.DiscountAmount,
            this.Total});
            this.orderItemsGrid.Location = new System.Drawing.Point(12, 217);
            this.orderItemsGrid.Name = "orderItemsGrid";
            this.orderItemsGrid.ReadOnly = true;
            this.orderItemsGrid.RowHeadersWidth = 51;
            this.orderItemsGrid.RowTemplate.Height = 24;
            this.orderItemsGrid.Size = new System.Drawing.Size(873, 293);
            this.orderItemsGrid.TabIndex = 9;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label6.Location = new System.Drawing.Point(20, 201);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(72, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Order Items";
            // 
            // lblOrderDiscount
            // 
            this.lblOrderDiscount.AutoSize = true;
            this.lblOrderDiscount.Location = new System.Drawing.Point(345, 22);
            this.lblOrderDiscount.Name = "lblOrderDiscount";
            this.lblOrderDiscount.Size = new System.Drawing.Size(86, 15);
            this.lblOrderDiscount.TabIndex = 12;
            this.lblOrderDiscount.Text = "Order discount";
            // 
            // lblOrderTaxAmount
            // 
            this.lblOrderTaxAmount.AutoSize = true;
            this.lblOrderTaxAmount.Location = new System.Drawing.Point(345, 53);
            this.lblOrderTaxAmount.Name = "lblOrderTaxAmount";
            this.lblOrderTaxAmount.Size = new System.Drawing.Size(57, 15);
            this.lblOrderTaxAmount.TabIndex = 13;
            this.lblOrderTaxAmount.Text = "Order Tax";
            // 
            // lblShippingFee
            // 
            this.lblShippingFee.AutoSize = true;
            this.lblShippingFee.Location = new System.Drawing.Point(582, 53);
            this.lblShippingFee.Name = "lblShippingFee";
            this.lblShippingFee.Size = new System.Drawing.Size(73, 15);
            this.lblShippingFee.TabIndex = 14;
            this.lblShippingFee.Text = "Shipping fee";
            // 
            // lblPaymentFee
            // 
            this.lblPaymentFee.AutoSize = true;
            this.lblPaymentFee.Location = new System.Drawing.Point(345, 134);
            this.lblPaymentFee.Name = "lblPaymentFee";
            this.lblPaymentFee.Size = new System.Drawing.Size(73, 15);
            this.lblPaymentFee.TabIndex = 15;
            this.lblPaymentFee.Text = "Payment fee";
            // 
            // lblOrderTotal
            // 
            this.lblOrderTotal.AutoSize = true;
            this.lblOrderTotal.Location = new System.Drawing.Point(20, 134);
            this.lblOrderTotal.Name = "lblOrderTotal";
            this.lblOrderTotal.Size = new System.Drawing.Size(64, 15);
            this.lblOrderTotal.TabIndex = 16;
            this.lblOrderTotal.Text = "Order total";
            // 
            // lblPaymentMethod
            // 
            this.lblPaymentMethod.AutoSize = true;
            this.lblPaymentMethod.Location = new System.Drawing.Point(345, 109);
            this.lblPaymentMethod.Name = "lblPaymentMethod";
            this.lblPaymentMethod.Size = new System.Drawing.Size(99, 15);
            this.lblPaymentMethod.TabIndex = 17;
            this.lblPaymentMethod.Text = "Payment method";
            // 
            // lblUser
            // 
            this.lblUser.AutoSize = true;
            this.lblUser.Location = new System.Drawing.Point(20, 53);
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(30, 15);
            this.lblUser.TabIndex = 18;
            this.lblUser.Text = "User";
            // 
            // lblShippingMethod
            // 
            this.lblShippingMethod.AutoSize = true;
            this.lblShippingMethod.Location = new System.Drawing.Point(582, 22);
            this.lblShippingMethod.Name = "lblShippingMethod";
            this.lblShippingMethod.Size = new System.Drawing.Size(99, 15);
            this.lblShippingMethod.TabIndex = 19;
            this.lblShippingMethod.Text = "Shipping method";
            // 
            // lblProductDiscount
            // 
            this.lblProductDiscount.AutoSize = true;
            this.lblProductDiscount.Location = new System.Drawing.Point(582, 81);
            this.lblProductDiscount.Name = "lblProductDiscount";
            this.lblProductDiscount.Size = new System.Drawing.Size(143, 15);
            this.lblProductDiscount.TabIndex = 20;
            this.lblProductDiscount.Text = "Product discount amount";
            // 
            // lblProductTaxAmount
            // 
            this.lblProductTaxAmount.AutoSize = true;
            this.lblProductTaxAmount.Location = new System.Drawing.Point(582, 109);
            this.lblProductTaxAmount.Name = "lblProductTaxAmount";
            this.lblProductTaxAmount.Size = new System.Drawing.Size(113, 15);
            this.lblProductTaxAmount.TabIndex = 21;
            this.lblProductTaxAmount.Text = "Product tax amount";
            // 
            // lblSubTotal
            // 
            this.lblSubTotal.AutoSize = true;
            this.lblSubTotal.Location = new System.Drawing.Point(345, 81);
            this.lblSubTotal.Name = "lblSubTotal";
            this.lblSubTotal.Size = new System.Drawing.Size(55, 15);
            this.lblSubTotal.TabIndex = 22;
            this.lblSubTotal.Text = "Sub Total";
            // 
            // lblStatus
            // 
            this.lblStatus.AutoSize = true;
            this.lblStatus.Location = new System.Drawing.Point(582, 134);
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(71, 15);
            this.lblStatus.TabIndex = 23;
            this.lblStatus.Text = "Order status";
            // 
            // lblDescription
            // 
            this.lblDescription.AutoSize = true;
            this.lblDescription.Location = new System.Drawing.Point(20, 169);
            this.lblDescription.Name = "lblDescription";
            this.lblDescription.Size = new System.Drawing.Size(67, 15);
            this.lblDescription.TabIndex = 24;
            this.lblDescription.Text = "Description";
            // 
            // ProductName
            // 
            this.ProductName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.ProductName.DataPropertyName = "ProductName";
            this.ProductName.HeaderText = "Product name";
            this.ProductName.MinimumWidth = 6;
            this.ProductName.Name = "ProductName";
            this.ProductName.ReadOnly = true;
            // 
            // ProductPrice
            // 
            this.ProductPrice.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.ProductPrice.DataPropertyName = "ProductPrice";
            this.ProductPrice.HeaderText = "Price";
            this.ProductPrice.MinimumWidth = 6;
            this.ProductPrice.Name = "ProductPrice";
            this.ProductPrice.ReadOnly = true;
            // 
            // Quantity
            // 
            this.Quantity.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Quantity.DataPropertyName = "Quantity";
            this.Quantity.HeaderText = "Quantity";
            this.Quantity.MinimumWidth = 6;
            this.Quantity.Name = "Quantity";
            this.Quantity.ReadOnly = true;
            // 
            // DiscountAmount
            // 
            this.DiscountAmount.DataPropertyName = "DiscountAmount";
            this.DiscountAmount.HeaderText = "Discount Amount";
            this.DiscountAmount.Name = "DiscountAmount";
            this.DiscountAmount.ReadOnly = true;
            // 
            // Total
            // 
            this.Total.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Total.DataPropertyName = "Total";
            this.Total.HeaderText = "Total";
            this.Total.MinimumWidth = 6;
            this.Total.Name = "Total";
            this.Total.ReadOnly = true;
            // 
            // frmOrderDetails
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(897, 522);
            this.Controls.Add(this.lblDescription);
            this.Controls.Add(this.lblStatus);
            this.Controls.Add(this.lblSubTotal);
            this.Controls.Add(this.lblProductTaxAmount);
            this.Controls.Add(this.lblProductDiscount);
            this.Controls.Add(this.lblShippingMethod);
            this.Controls.Add(this.lblUser);
            this.Controls.Add(this.lblPaymentMethod);
            this.Controls.Add(this.lblOrderTotal);
            this.Controls.Add(this.lblPaymentFee);
            this.Controls.Add(this.lblShippingFee);
            this.Controls.Add(this.lblOrderTaxAmount);
            this.Controls.Add(this.lblOrderDiscount);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.orderItemsGrid);
            this.Controls.Add(this.lblStatusNarudzbe);
            this.Controls.Add(this.lblPayedClosed);
            this.Controls.Add(this.lblDatumNarudzbe);
            this.Controls.Add(this.lblOrderDate);
            this.Controls.Add(this.lblKlijentImePrezime);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblOrderNumber);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmOrderDetails";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Order Details";
            this.Load += new System.EventHandler(this.frmOrderDetails_Load);
            ((System.ComponentModel.ISupportInitialize)(this.orderItemsGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblOrderNumber;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblKlijentImePrezime;
        private System.Windows.Forms.Label lblOrderDate;
        private System.Windows.Forms.Label lblDatumNarudzbe;
        private System.Windows.Forms.Label lblPayedClosed;
        private System.Windows.Forms.Label lblStatusNarudzbe;
        private System.Windows.Forms.DataGridView orderItemsGrid;
        private System.Windows.Forms.Label label6;
        private Label lblOrderDiscount;
        private Label lblOrderTaxAmount;
        private Label lblShippingFee;
        private Label lblPaymentFee;
        private Label lblOrderTotal;
        private Label lblPaymentMethod;
        private Label lblUser;
        private Label lblShippingMethod;
        private Label lblProductDiscount;
        private Label lblProductTaxAmount;
        private Label lblSubTotal;
        private Label lblStatus;
        private Label lblDescription;
        private new DataGridViewTextBoxColumn ProductName;
        private DataGridViewTextBoxColumn ProductPrice;
        private DataGridViewTextBoxColumn Quantity;
        private DataGridViewTextBoxColumn DiscountAmount;
        private DataGridViewTextBoxColumn Total;
    }
}