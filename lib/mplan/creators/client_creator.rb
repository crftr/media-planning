module MPLAN
  module Creators
    class ClientCreator < BaseCreator
      attribute :user,        User
      attribute :client_name, String

      validates :user,        presence: true
      validates :client_name, presence: true

      protected

        def persist!
          Client.create(name: client_name, user_id: user_id)
        end

        def user_id
          user.try(:id) || user
        end
    end
  end
end
