
namespace Poseidon.WinUI.Forms
{
    partial class frmOfferGrid
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
            this.offerGrid = new System.Windows.Forms.DataGridView();
            this.DiscountOfferId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Title = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Discount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StartDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.EndDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Edit = new System.Windows.Forms.DataGridViewButtonColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtOfferSearch = new System.Windows.Forms.TextBox();
            this.btnEdit = new System.Windows.Forms.Button();
            this.dateFrom = new System.Windows.Forms.DateTimePicker();
            this.dateUntil = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.btnReloadOffers = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.offerGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // offerGrid
            // 
            this.offerGrid.AllowUserToAddRows = false;
            this.offerGrid.AllowUserToDeleteRows = false;
            this.offerGrid.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.offerGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.offerGrid.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.offerGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.offerGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.DiscountOfferId,
            this.Title,
            this.Description,
            this.Discount,
            this.StartDate,
            this.EndDate,
            this.Edit});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.offerGrid.DefaultCellStyle = dataGridViewCellStyle2;
            this.offerGrid.Location = new System.Drawing.Point(22, 101);
            this.offerGrid.Name = "offerGrid";
            this.offerGrid.ReadOnly = true;
            this.offerGrid.RowHeadersWidth = 51;
            this.offerGrid.RowTemplate.Height = 24;
            this.offerGrid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.offerGrid.Size = new System.Drawing.Size(1140, 518);
            this.offerGrid.TabIndex = 0;
            this.offerGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.offerGrid_CellContentClick);
            // 
            // DiscountOfferId
            // 
            this.DiscountOfferId.DataPropertyName = "DiscountOfferId";
            this.DiscountOfferId.HeaderText = "Id";
            this.DiscountOfferId.MinimumWidth = 6;
            this.DiscountOfferId.Name = "DiscountOfferId";
            this.DiscountOfferId.ReadOnly = true;
            this.DiscountOfferId.Visible = false;
            // 
            // Title
            // 
            this.Title.DataPropertyName = "Title";
            this.Title.HeaderText = "Title";
            this.Title.Name = "Title";
            this.Title.ReadOnly = true;
            // 
            // Description
            // 
            this.Description.DataPropertyName = "Description";
            this.Description.HeaderText = "Description";
            this.Description.MinimumWidth = 6;
            this.Description.Name = "Description";
            this.Description.ReadOnly = true;
            // 
            // Discount
            // 
            this.Discount.DataPropertyName = "Discount";
            this.Discount.HeaderText = "Discount";
            this.Discount.MinimumWidth = 6;
            this.Discount.Name = "Discount";
            this.Discount.ReadOnly = true;
            // 
            // StartDate
            // 
            this.StartDate.DataPropertyName = "StartDate";
            this.StartDate.HeaderText = "Start Date";
            this.StartDate.MinimumWidth = 6;
            this.StartDate.Name = "StartDate";
            this.StartDate.ReadOnly = true;
            // 
            // EndDate
            // 
            this.EndDate.HeaderText = "End Date";
            this.EndDate.Name = "EndDate";
            this.EndDate.ReadOnly = true;
            // 
            // Edit
            // 
            this.Edit.HeaderText = "Action";
            this.Edit.MinimumWidth = 6;
            this.Edit.Name = "Edit";
            this.Edit.ReadOnly = true;
            this.Edit.Text = "Edit";
            this.Edit.UseColumnTextForButtonValue = true;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 15);
            this.label1.TabIndex = 1;
            this.label1.Text = "Search";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(295, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 15);
            this.label2.TabIndex = 2;
            this.label2.Text = "From";
            // 
            // txtOfferSearch
            // 
            this.txtOfferSearch.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txtOfferSearch.Location = new System.Drawing.Point(22, 39);
            this.txtOfferSearch.Name = "txtOfferSearch";
            this.txtOfferSearch.Size = new System.Drawing.Size(177, 23);
            this.txtOfferSearch.TabIndex = 3;
            this.txtOfferSearch.TextChanged += new System.EventHandler(this.txtOfferSearch_TextChanged);
            // 
            // btnEdit
            // 
            this.btnEdit.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnEdit.Location = new System.Drawing.Point(1091, 33);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(61, 28);
            this.btnEdit.TabIndex = 5;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnOfferDetails_Click);
            // 
            // dateFrom
            // 
            this.dateFrom.Location = new System.Drawing.Point(295, 34);
            this.dateFrom.Name = "dateFrom";
            this.dateFrom.Size = new System.Drawing.Size(200, 23);
            this.dateFrom.TabIndex = 6;
            this.dateFrom.ValueChanged += new System.EventHandler(this.dateFrom_ValueChanged);
            // 
            // dateUntil
            // 
            this.dateUntil.Location = new System.Drawing.Point(553, 33);
            this.dateUntil.Name = "dateUntil";
            this.dateUntil.Size = new System.Drawing.Size(200, 23);
            this.dateUntil.TabIndex = 7;
            this.dateUntil.ValueChanged += new System.EventHandler(this.dateUntil_ValueChanged);
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(553, 15);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 15);
            this.label3.TabIndex = 8;
            this.label3.Text = "Until";
            // 
            // btnReloadOffers
            // 
            this.btnReloadOffers.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnReloadOffers.Location = new System.Drawing.Point(883, 33);
            this.btnReloadOffers.Name = "btnReloadOffers";
            this.btnReloadOffers.Size = new System.Drawing.Size(70, 28);
            this.btnReloadOffers.TabIndex = 9;
            this.btnReloadOffers.Text = "Reload";
            this.btnReloadOffers.UseVisualStyleBackColor = true;
            this.btnReloadOffers.Click += new System.EventHandler(this.btnReloadOffers_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnAdd.Location = new System.Drawing.Point(988, 34);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(73, 28);
            this.btnAdd.TabIndex = 10;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // frmOfferGrid
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1184, 641);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnReloadOffers);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dateUntil);
            this.Controls.Add(this.dateFrom);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.txtOfferSearch);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.offerGrid);
            this.Name = "frmOfferGrid";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Offers";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmOfferGrid_Load);
            ((System.ComponentModel.ISupportInitialize)(this.offerGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView offerGrid;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtOfferSearch;
        private System.Windows.Forms.Button btnEdit;
        private DateTimePicker dateFrom;
        private DateTimePicker dateUntil;
        private Label label3;
        private DataGridViewTextBoxColumn DiscountOfferId;
        private DataGridViewTextBoxColumn Title;
        private DataGridViewTextBoxColumn Description;
        private DataGridViewTextBoxColumn Discount;
        private DataGridViewTextBoxColumn StartDate;
        private DataGridViewTextBoxColumn EndDate;
        private DataGridViewButtonColumn Edit;
        private Button btnReloadOffers;
        private Button btnAdd;
    }
}