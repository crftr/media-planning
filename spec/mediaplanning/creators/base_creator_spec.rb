
describe MPLAN::Creators::BaseCreator do
  let(:creator) { MPLAN::Creators::BaseCreator.new }

  describe '#persisted?' do
    it { expect(creator.persisted?).to be_falsey }
  end

  describe '#save' do
    it 'should verify validity before saving' do
      expect(creator).to receive(:valid?)
      creator.save
    end

    it { expect(creator.save).to be_truthy }
  end
end
