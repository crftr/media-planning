module MPLAN
  module Creators
    class VendorCreator < BaseCreator
      attribute :user,        User
      attribute :vendor_name, String

      validates :user,        presence: true
      validates :vendor_name, presence: true

      protected

        def persist!
          Vendor.create(name: vendor_name, user_id: user_id)
        end

        def user_id
          user.try(:id) || user
        end
    end
  end
end
