namespace Poseidon.WinUI.Forms
{
    public partial class frmOfferAdd : Form
    {

        private int? _offerId;
        private bool _edit;

        public frmOfferAdd(int? offerId, bool edit = false)
        {
            InitializeComponent();
            _offerId = offerId; 
            _edit = edit;
        }
        private bool Validacija()
        {
            errorProvider1.Clear();

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                errorProvider1.SetError(txtTitle, "Title is required");
                return false;
            }
            else if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                errorProvider1.SetError(txtDescription, "Description is required");
                return false;
            }
            else 
            if (!(txtDiscount.Value > 0))
            {
                errorProvider1.SetError(txtDiscount, "Discount percent must be greater than 0");
                return false;
            }else 
            if (!_edit && dtpStartDate.Value < DateTime.Now)
            {
                errorProvider1.SetError(dtpStartDate, "Start date must be future.");
                return false;
            }else
            if (!_edit && (dtpEndDate.Value < DateTime.Now || dtpEndDate.Value <= dtpStartDate.Value))
            {
                errorProvider1.SetError(dtpEndDate, "End date must be future and not less or equal to start date");
                return false;
            }

            return true;
        }

        private async void LoadEditMode()
        {

            if (_offerId is not null)
            {
                var apiClient = await CreatePoseidonClient();

                var result = await apiClient.ApiDiscountofferQueryAsync(1, 2, $"discountOfferId={_offerId}", null);
               
                var offer = result.Items?.FirstOrDefault();
                if (offer is not null)
                {
                    txtDescription.Text          = offer.Description;
                    txtTitle.Text                = offer.Title;
                    txtDiscount.Value            = offer.Discount ?? 0;
                    txtImageUrl.Text             = offer.ImageUrl ?? String.Empty; 

                    dtpStartDate.Value           = offer.StartDate is not null 
                        ? offer.StartDate.Value.DateTime : DateTime.Now;

                    dtpEndDate.Value = offer.EndDate is not null
                        ? offer.EndDate.Value.DateTime : DateTime.Now;
                }
                else
                {
                    _offerId = null;
                }

            }

        }

        private void frmOfferAdd_Load(object sender, EventArgs e)
        { 
            LoadEditMode();
        }

        private async void UpsertOffer()
        {
            if (!Validacija())
                return;

            TimeSpan offset = TimeZoneInfo
                .FindSystemTimeZoneById("Central Standard Time")
                .GetUtcOffset(dtpStartDate.Value);

            var apiClient = await CreatePoseidonClient();

            await apiClient.ApiDiscountofferUpsertAsync(new ()
            {    
                DiscountOfferId = _offerId,
                Title           = txtTitle.Text,
                Description     = txtDescription.Text,
                ImageUrl        = txtImageUrl.Text,
                StartDate       = new DateTimeOffset(dtpStartDate.Value, offset),
                EndDate         = new DateTimeOffset(dtpEndDate.Value, offset),
                Discount        = txtDiscount.Value
            });
            this.Close();
        }

        private void btnOfferUpsert_Click(object sender, EventArgs e)
        {
            UpsertOffer();
        }
    }
}
