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

class Contract < ActiveRecord::Base
  has_and_belongs_to_many :engagements
  belongs_to :campaign_type
  belongs_to :financial_year
  belongs_to :user
  belongs_to :vendor

  monetize :amount_cents

  def to_s
    campaign_name
  end
end
