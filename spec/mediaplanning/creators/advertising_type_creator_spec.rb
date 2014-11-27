
describe MPLAN::Creators::AdvertisingTypeCreator do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:media_type) { FactoryGirl.create(:media_type) }
  let!(:type_name) { Faker::Lorem.word }
  let!(:params) { {user: user, media_type: media_type, name_of_type: type_name } }

  describe 'validations' do
    it { expect(advertising_type_creator.valid?).to be_truthy }
    it { expect(advertising_type_creator).to validate_presence_of(:user) }
    it { expect(advertising_type_creator).to validate_presence_of(:name_of_type) }
    it { expect(advertising_type_creator).to validate_presence_of(:media_type) }
  end

  describe '#save' do
    it { expect { advertising_type_creator.save }.to change { AdvertisingType.count }.by(1) }
  end

  def advertising_type_creator(args = params)
    MPLAN::Creators::AdvertisingTypeCreator.new(args)
  end
end
