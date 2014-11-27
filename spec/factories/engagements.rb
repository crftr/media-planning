# == Schema Information
#
# Table name: engagements
#
#  id         :integer          not null, primary key
#  client_id  :integer          not null
#  name       :text             not null
#  url        :text
#  phone      :text
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do

  sequence :engagement_name do |n|
    suffix = ['Show', 'Engagement', 'Program', 'The Famous', 'Exhibition',
              'Reunion', nil, nil, nil, nil, nil].shuffle[0]
    suffix.nil? ? Faker::Company.name : [Faker::Company.name, suffix].join(' ')
  end

  factory :engagement do
    client
    name      { FactoryGirl.generate :engagement_name }
    url       { Faker::Internet.url }
    phone     { Faker::PhoneNumber.phone_number }
  end
end
