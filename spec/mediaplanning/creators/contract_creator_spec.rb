
#  campaign_type_id  :integer          not null
#  financial_year_id :integer          not null
#  user_id           :integer          not null
#  vendor_id         :integer          not null

#  amount_cents      :integer          default(0), not null
#  amount_currency   :string(255)      default("USD"), not null
#  contract_date     :date             not null
#  contract_number   :text
#  campaign_name     :text             not null


describe MPLAN::Creators::ContractCreator do
  let!(:user)           { FactoryGirl.create(:user) }
  let!(:client)         { FactoryGirl.create(:client, user: user) }
  let!(:campaign_type)  { FactoryGirl.create(:campaign_type) }
  let!(:engagement_1)   { FactoryGirl.create(:engagement, client: client) }
  let!(:engagement_2)   { FactoryGirl.create(:engagement, client: client) }
  let!(:financial_year) { FactoryGirl.create(:financial_year, user: user) }
  let!(:vendor)         { FactoryGirl.create(:vendor, user: user) }

  let!(:amount)          { (rand(5_000) + 5_000).to_money }
  let!(:contract_date)   { (rand(10) + 5).months.ago.to_date }
  let!(:contract_number) { Faker::Address.street_address }
  let!(:campaign_name)   { Faker::Business.name }

  let(:params) { {
    campaign_type:   campaign_type,
    engagements:     [engagement_1, engagement_2],
    financial_year:  financial_year,
    user:            user,
    vendor:          vendor,
    amount:          amount,
    contract_date:   contract_date,
    contract_number: contract_number,
    campaign_name:   campaign_name
  } }

  describe 'validations' do
    it { expect(contract_creator.valid?).to be_truthy }
    it { expect(contract_creator).to validate_presence_of(:campaign_type) }
    it { expect(contract_creator).to validate_presence_of(:financial_year) }
    it { expect(contract_creator).to validate_presence_of(:user) }
    it { expect(contract_creator).to validate_presence_of(:vendor) }
    it { expect(contract_creator).to validate_presence_of(:amount) }
    it { expect(contract_creator).to validate_presence_of(:contract_date) }
    # it { expect(contract_creator).to validate_presence_of(:contract_number) }
    it { expect(contract_creator).to validate_presence_of(:campaign_name) }
    it { expect(contract_creator).to validate_presence_of(:engagements) }
  end

  describe '#save' do
    it { expect { contract_creator.save }.to change { Contract.count }.by(1) }
  end

  describe 'engagements' do
    before do
      contract_creator.save
      @contract = Contract.last
    end
    it { expect(@contract.engagements).to contain_exactly(engagement_1, engagement_2) }
  end

  def contract_creator(args = params)
    MPLAN::Creators::ContractCreator.new(args)
  end
end
