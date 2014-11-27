
describe MPLAN::Creators::FinancialYearCreator do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fy_name) { Faker::Lorem.word }
  let!(:start_date) { 2.years.ago.to_date }
  let!(:end_date) { 1.years.ago.to_date }
  let!(:params) { {user: user, name: fy_name, start_date: start_date, end_date: end_date } }

  describe 'validations' do
    it { expect(financial_year_creator.valid?).to be_truthy }
    it { expect(financial_year_creator).to validate_presence_of(:user) }
    it { expect(financial_year_creator).to validate_presence_of(:start_date) }
    it { expect(financial_year_creator).to validate_presence_of(:end_date) }

    it { expect(financial_year_creator(params.merge({end_date: start_date})).valid?).to be_falsey }
  end

  describe '#save' do
    it { expect { financial_year_creator.save }.to change { FinancialYear.count }.by(1) }
  end

  def financial_year_creator(args = params)
    MPLAN::Creators::FinancialYearCreator.new(args)
  end
end
