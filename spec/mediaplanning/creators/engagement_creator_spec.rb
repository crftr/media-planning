
describe MPLAN::Creators::EngagementCreator do
  let!(:client) { FactoryGirl.create(:client) }
  let!(:engagement_name) { 'Engagement at the Forum' }
  let!(:params) { { engagement_name: engagement_name, client: client } }

  describe 'validations' do
    it { expect(engagement_creator.valid?).to be_truthy }
    it { expect(engagement_creator).to validate_presence_of(:client) }
    it { expect(engagement_creator).to validate_presence_of(:engagement_name) }
  end

  describe '#save' do
    it { expect { engagement_creator.save }.to change { Engagement.count }.by(1) }
  end

  def engagement_creator(args = params)
    MPLAN::Creators::EngagementCreator.new(args)
  end
end
