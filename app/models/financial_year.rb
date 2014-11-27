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

class FinancialYear < ActiveRecord::Base
  belongs_to :user

  def to_s
    name
  end
end
