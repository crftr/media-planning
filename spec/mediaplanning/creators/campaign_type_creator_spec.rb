
describe MPLAN::Creators::CampaignTypeCreator do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:type_name) { Faker::Lorem.word }
  let!(:params) { {user: user, name_of_type: type_name } }

  describe 'validations' do
    it { expect(campaign_type_creator.valid?).to be_truthy }
    it { expect(campaign_type_creator).to validate_presence_of(:user) }
    it { expect(campaign_type_creator).to validate_presence_of(:name_of_type) }
  end

  describe '#save' do
    it { expect { campaign_type_creator.save }.to change { CampaignType.count }.by(1) }
  end

  def campaign_type_creator(args = params)
    MPLAN::Creators::CampaignTypeCreator.new(args)
  end
end
