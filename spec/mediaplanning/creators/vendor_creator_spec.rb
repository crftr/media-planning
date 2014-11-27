
describe MPLAN::Creators::VendorCreator do
  let!(:user) { FactoryGirl.build(:user, id: 30) }
  let!(:vendor_name) { 'Huuuuge Billboards LLC' }
  let!(:params) { { user: user, vendor_name: vendor_name } }

  describe 'validations' do
    it { expect(vendor_creator.valid?).to be_truthy }
    it { expect(vendor_creator).to validate_presence_of(:user) }
    it { expect(vendor_creator).to validate_presence_of(:vendor_name) }
  end

  describe '#save' do
    it { expect { vendor_creator.save }.to change { Vendor.count }.by(1) }
  end

  def vendor_creator(args = params)
    MPLAN::Creators::VendorCreator.new(args)
  end
end
