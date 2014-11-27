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

class CampaignType < ActiveRecord::Base
  belongs_to :user

  def to_s
    name
  end
end
