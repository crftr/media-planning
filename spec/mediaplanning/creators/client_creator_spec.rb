
describe MPLAN::Creators::ClientCreator do
  let!(:user) { FactoryGirl.build(:user, id: 30) }
  let!(:client_name) { 'Surfer Jims' }
  let!(:params) { { user: user, client_name: client_name } }

  describe 'validations' do
    it { expect(client_creator.valid?).to be_truthy }
    it { expect(client_creator).to validate_presence_of(:user) }
    it { expect(client_creator).to validate_presence_of(:client_name) }
  end

  describe '#save' do
    it { expect { client_creator.save }.to change { Client.count }.by(1) }
  end

  def client_creator(args = params)
    MPLAN::Creators::ClientCreator.new(args)
  end
end
