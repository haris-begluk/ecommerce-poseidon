
namespace Poseidon.WinUI.Forms
{
    partial class frmOfferDetail
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
            this.lblOfferNumber = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblStartDate = new System.Windows.Forms.Label();
            this.lblDatumNarudzbe = new System.Windows.Forms.Label();
            this.lblEndDate = new System.Windows.Forms.Label();
            this.lblStatusNarudzbe = new System.Windows.Forms.Label();
            this.offerDetailGrid = new System.Windows.Forms.DataGridView();
            this.label6 = new System.Windows.Forms.Label();
            this.lblDiscount = new System.Windows.Forms.Label();
            this.lblTitle = new System.Windows.Forms.Label();
            this.lblDescription = new System.Windows.Forms.Label();
            this.btnAddProduct = new System.Windows.Forms.Button();
            this.drlProducts = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.ProductId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Number = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Unit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Remove = new System.Windows.Forms.DataGridViewButtonColumn();
            ((System.ComponentModel.ISupportInitialize)(this.offerDetailGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // lblOfferNumber
            // 
            this.lblOfferNumber.AutoSize = true;
            this.lblOfferNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lblOfferNumber.Location = new System.Drawing.Point(20, 22);
            this.lblOfferNumber.Name = "lblOfferNumber";
            this.lblOfferNumber.Size = new System.Drawing.Size(82, 13);
            this.lblOfferNumber.TabIndex = 0;
            this.lblOfferNumber.Text = "Offer Number";
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
            // lblStartDate
            // 
            this.lblStartDate.AutoSize = true;
            this.lblStartDate.Location = new System.Drawing.Point(290, 22);
            this.lblStartDate.Name = "lblStartDate";
            this.lblStartDate.Size = new System.Drawing.Size(57, 15);
            this.lblStartDate.TabIndex = 5;
            this.lblStartDate.Text = "Start date";
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
            // lblEndDate
            // 
            this.lblEndDate.AutoSize = true;
            this.lblEndDate.Location = new System.Drawing.Point(290, 53);
            this.lblEndDate.Name = "lblEndDate";
            this.lblEndDate.Size = new System.Drawing.Size(53, 15);
            this.lblEndDate.TabIndex = 7;
            this.lblEndDate.Text = "End date";
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
            // offerDetailGrid
            // 
            this.offerDetailGrid.AllowUserToAddRows = false;
            this.offerDetailGrid.AllowUserToDeleteRows = false;
            this.offerDetailGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.offerDetailGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ProductId,
            this.ProductName,
            this.Price,
            this.Number,
            this.Unit,
            this.Description,
            this.Remove});
            this.offerDetailGrid.Location = new System.Drawing.Point(20, 111);
            this.offerDetailGrid.Name = "offerDetailGrid";
            this.offerDetailGrid.ReadOnly = true;
            this.offerDetailGrid.RowHeadersWidth = 51;
            this.offerDetailGrid.RowTemplate.Height = 24;
            this.offerDetailGrid.Size = new System.Drawing.Size(1139, 518);
            this.offerDetailGrid.TabIndex = 9;
            this.offerDetailGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.offerGrid_CellContentClick);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label6.Location = new System.Drawing.Point(20, 95);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(88, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Offer products";
            // 
            // lblDiscount
            // 
            this.lblDiscount.AutoSize = true;
            this.lblDiscount.Location = new System.Drawing.Point(535, 22);
            this.lblDiscount.Name = "lblDiscount";
            this.lblDiscount.Size = new System.Drawing.Size(54, 15);
            this.lblDiscount.TabIndex = 16;
            this.lblDiscount.Text = "Discount";
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Location = new System.Drawing.Point(20, 53);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(29, 15);
            this.lblTitle.TabIndex = 18;
            this.lblTitle.Text = "Title";
            // 
            // lblDescription
            // 
            this.lblDescription.AutoSize = true;
            this.lblDescription.Location = new System.Drawing.Point(535, 53);
            this.lblDescription.Name = "lblDescription";
            this.lblDescription.Size = new System.Drawing.Size(67, 15);
            this.lblDescription.TabIndex = 24;
            this.lblDescription.Text = "Description";
            // 
            // btnAddProduct
            // 
            this.btnAddProduct.Location = new System.Drawing.Point(1032, 53);
            this.btnAddProduct.Name = "btnAddProduct";
            this.btnAddProduct.Size = new System.Drawing.Size(127, 23);
            this.btnAddProduct.TabIndex = 26;
            this.btnAddProduct.Text = "Add product";
            this.btnAddProduct.UseVisualStyleBackColor = true;
            this.btnAddProduct.Click += new System.EventHandler(this.btnAddProduct_Click);
            // 
            // drlProducts
            // 
            this.drlProducts.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.drlProducts.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.drlProducts.FormattingEnabled = true;
            this.drlProducts.Location = new System.Drawing.Point(767, 18);
            this.drlProducts.Name = "drlProducts";
            this.drlProducts.Size = new System.Drawing.Size(392, 23);
            this.drlProducts.TabIndex = 27;
            this.drlProducts.SelectedIndexChanged += new System.EventHandler(this.drlProducts_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(707, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 15);
            this.label1.TabIndex = 28;
            this.label1.Text = "Products";
            // 
            // ProductId
            // 
            this.ProductId.DataPropertyName = "ProductId";
            this.ProductId.HeaderText = "Id";
            this.ProductId.Name = "ProductId";
            this.ProductId.ReadOnly = true;
            this.ProductId.Visible = false;
            // 
            // ProductName
            // 
            this.ProductName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.ProductName.DataPropertyName = "Name";
            this.ProductName.HeaderText = "Product name";
            this.ProductName.MinimumWidth = 6;
            this.ProductName.Name = "ProductName";
            this.ProductName.ReadOnly = true;
            // 
            // Price
            // 
            this.Price.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Price.DataPropertyName = "Price";
            this.Price.HeaderText = "Price";
            this.Price.MinimumWidth = 6;
            this.Price.Name = "Price";
            this.Price.ReadOnly = true;
            // 
            // Number
            // 
            this.Number.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Number.DataPropertyName = "Number";
            this.Number.HeaderText = "Number";
            this.Number.MinimumWidth = 6;
            this.Number.Name = "Number";
            this.Number.ReadOnly = true;
            // 
            // Unit
            // 
            this.Unit.DataPropertyName = "Unit";
            this.Unit.HeaderText = "Unit";
            this.Unit.Name = "Unit";
            this.Unit.ReadOnly = true;
            // 
            // Description
            // 
            this.Description.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Description.DataPropertyName = "Description";
            this.Description.HeaderText = "Decription";
            this.Description.MinimumWidth = 6;
            this.Description.Name = "Description";
            this.Description.ReadOnly = true;
            // 
            // Remove
            // 
            this.Remove.HeaderText = "Remove";
            this.Remove.Name = "Remove";
            this.Remove.ReadOnly = true;
            this.Remove.Text = "Remove";
            this.Remove.UseColumnTextForButtonValue = true;
            // 
            // frmOfferDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1184, 641);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.drlProducts);
            this.Controls.Add(this.btnAddProduct);
            this.Controls.Add(this.lblDescription);
            this.Controls.Add(this.lblTitle);
            this.Controls.Add(this.lblDiscount);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.offerDetailGrid);
            this.Controls.Add(this.lblStatusNarudzbe);
            this.Controls.Add(this.lblEndDate);
            this.Controls.Add(this.lblDatumNarudzbe);
            this.Controls.Add(this.lblStartDate);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblOfferNumber);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmOfferDetail";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Offer Details";
            this.Load += new System.EventHandler(this.frmOfferDetails_Load);
            ((System.ComponentModel.ISupportInitialize)(this.offerDetailGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblOfferNumber;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblStartDate;
        private System.Windows.Forms.Label lblDatumNarudzbe;
        private System.Windows.Forms.Label lblEndDate;
        private System.Windows.Forms.Label lblStatusNarudzbe;
        private System.Windows.Forms.DataGridView offerDetailGrid;
        private System.Windows.Forms.Label label6;
        private Label lblDiscount;
        private Label lblTitle;
        private Label lblDescription;
        private Button btnAddProduct;
        private ComboBox drlProducts;
        private Label label1;
        private DataGridViewTextBoxColumn ProductId;
        private new DataGridViewTextBoxColumn ProductName;
        private DataGridViewTextBoxColumn Price;
        private DataGridViewTextBoxColumn Number;
        private DataGridViewTextBoxColumn Unit;
        private DataGridViewTextBoxColumn Description;
        private DataGridViewButtonColumn Remove;
    }
}