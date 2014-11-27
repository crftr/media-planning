module MPLAN
  module Creators
    class AdvertisingTypeCreator < BaseCreator
      attribute :choices_for_media_type, Array

      attribute :user,         User
      attribute :name_of_type, String
      attribute :media_type,   String

      validates :user,         presence: true
      validates :name_of_type, presence: true
      validates :media_type,   presence: true

      protected

        def persist!
          AdvertisingType.create(name: name_of_type, media_type_id: media_type_id, user: user)
        end

        def media_type_id
          media_type.try(:id) || media_type
        end
    end
  end
end
