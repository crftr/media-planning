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

class Client < ActiveRecord::Base
  belongs_to :user
  has_many :engagements

  def to_s
    name
  end
end
