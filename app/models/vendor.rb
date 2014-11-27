# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :text             not null
#  private    :boolean          default(TRUE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Vendor < ActiveRecord::Base
  belongs_to :user

  def to_s
    name
  end
end
