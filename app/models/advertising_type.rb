# == Schema Information
#
# Table name: advertising_types
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  media_type_id :integer          not null
#  name          :text             not null
#  global        :boolean          default(FALSE), not null
#  display_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class AdvertisingType < ActiveRecord::Base
  belongs_to :media_type
  belongs_to :user

  def to_s
    name
  end
end
