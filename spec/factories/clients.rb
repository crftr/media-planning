# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :client do
    user
    name { Faker::Company.name }
  end
end
