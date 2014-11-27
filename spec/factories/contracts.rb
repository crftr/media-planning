# == Schema Information
#
# Table name: contracts
#
#  id                :integer          not null, primary key
#  campaign_type_id  :integer          not null
#  financial_year_id :integer          not null
#  user_id           :integer          not null
#  vendor_id         :integer          not null
#  amount_cents      :integer          default(0), not null
#  amount_currency   :string(255)      default("USD"), not null
#  contract_date     :date             not null
#  contract_number   :text
#  campaign_name     :text             not null
#  created_at        :datetime
#  updated_at        :datetime
#

FactoryGirl.define do
  factory :contract do
    campaign_type
    user
    financial_year
    vendor
    campaign_name   { Faker::App.name }
    contract_date   { Date.today-rand(5000) }
    contract_number { Faker::Address.street_address }
  end
end
