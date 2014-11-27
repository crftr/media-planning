# == Schema Information
#
# Table name: financial_years
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :text             not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :financial_year do
    user
    name  { Faker::App.name }
    start_date { 2.years.ago.to_date }
    end_date   { 1.year.ago.to_date }
  end
end
