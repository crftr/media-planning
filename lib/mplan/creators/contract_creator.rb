module MPLAN
  module Creators
    class ContractCreator < BaseCreator

      attribute :choices_for_campaign_type,  Array
      attribute :choices_for_engagement,     Array
      attribute :choices_for_financial_year, Array
      attribute :choices_for_vendor,         Array

      attribute :campaign_type,     CampaignType
      attribute :engagements,       Array
      attribute :financial_year,    FinancialYear
      attribute :user,              User
      attribute :vendor,            Vendor
      attribute :amount,            Money
      attribute :contract_date,     Date
      attribute :contract_number,   String
      attribute :campaign_name,     String

      validates :campaign_type,     presence: true
      validates :engagements,       presence: true
      validates :financial_year,    presence: true
      validates :user,              presence: true
      validates :vendor,            presence: true
      validates :amount,            presence: true
      validates :contract_date,     presence: true
      validates :campaign_name,     presence: true

      protected

        def persist!
          Contract.create(
            campaign_type:   campaign_type_obj,
            engagements:     engagement_objs,
            financial_year:  financial_year_obj,
            user:            user,
            vendor:          vendor_obj,
            amount:          amount,
            contract_date:   contract_date,
            contract_number: contract_number,
            campaign_name:   campaign_name)
        end

        def campaign_type_obj
          user.campaign_types
            .where(id: campaign_type.try(:id) || campaign_type)
            .limit(1)[0]
        end

        def engagement_objs
          ids = engagements.inject([]) { |ids, e| ids <<  e.try(:id) || e }
          user.engagements
            .where(id: ids)
        end

        def financial_year_obj
          user.financial_years
            .where(id: financial_year.try(:id) || financial_year)
            .limit(1)[0]
        end

        def vendor_obj
          user.vendors
            .where(id: vendor.try(:id) || vendor)
            .limit(1)[0]
        end
    end
  end
end
