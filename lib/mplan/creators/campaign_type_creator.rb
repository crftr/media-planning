module MPLAN
  module Creators
    class CampaignTypeCreator < BaseCreator
      
      attribute :user,         User
      attribute :name_of_type, String

      validates :user,         presence: true
      validates :name_of_type, presence: true

      protected

        def persist!
          CampaignType.create(name: name_of_type, user: user)
        end
    end
  end
end
