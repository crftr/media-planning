class CreateContractsEngagements < ActiveRecord::Migration
  def change
    create_table :contracts_engagements, id: false do |t|
      t.belongs_to :contract
      t.belongs_to :engagement
    end
  end
end
