# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default(""), not null
#  organization           :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  admin                  :boolean          default(FALSE), not null
#  client_manager         :boolean          default(FALSE), not null
#  created_at             :datetime
#  updated_at             :datetime
#

FactoryGirl::USER_DEFAULT_PASSWORD ||= 'Password!'

FactoryGirl.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    username { Faker::Internet.user_name(nil, %w(-)) + rand(900).to_s }
    password FactoryGirl::USER_DEFAULT_PASSWORD
  end
end
