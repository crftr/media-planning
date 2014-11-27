module MPLAN
  module Creators
    class FinancialYearCreator < BaseCreator
      
      attribute :user,       User
      attribute :name,       String
      attribute :start_date, Date
      attribute :end_date,   Date

      validates :user,       presence: true
      validates :name,       presence: true
      validates :start_date, presence: true
      validates :end_date,   presence: true

      validate :start_date_is_prior_to_end_date

      protected

        def persist!
          FinancialYear.create(
            name: name, user: user, start_date: start_date, end_date: end_date)
        end

        def start_date_is_prior_to_end_date
          return if start_date.nil? || end_date.nil?
          errors.add(:end_date, 'must represent a date after start date') unless start_date < end_date
        end
    end
  end
end
