# == Schema Information
#
# Table name: campaign_types
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  global        :boolean          default(FALSE), not null
#  name          :text             not null
#  display_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

FactoryGirl.define do
  factory :campaign_type do
    global true
    name { Faker::App.name }
  end
end
