# == Schema Information
#
# Table name: media_types
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
  factory :media_type do
    name  { Faker::Lorem.word }
  end
end
