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

class Engagement < ActiveRecord::Base
  has_and_belongs_to_many :contracts
  belongs_to :client
end
