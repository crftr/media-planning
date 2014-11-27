module MPLAN
  module Creators
    class EngagementCreator < BaseCreator
      attribute :choices_for_client, Array

      attribute :client,          Client
      attribute :engagement_name, String

      validates :client,          presence: true
      validates :engagement_name, presence: true

      protected

        def persist!
          Engagement.create(name: engagement_name, client_id: client_id)
        end

        def client_id
          client.try(:id) || client
        end
    end
  end
end
