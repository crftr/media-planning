module MPLAN
  module Creators
    class BaseCreator
      include Virtus.model
      extend ActiveModel::Naming
      include ActiveModel::Conversion
      include ActiveModel::Validations

      def persisted?
        false
      end

      def save
        if valid?
          persist!
          true
        else
          false
        end
      end

      protected

        def persist!
          unless self.is_a? MPLAN::Creators::BaseCreator
            raise NotImplementedError, 'You must implement #persist'
          end
        end
    end
  end
end
