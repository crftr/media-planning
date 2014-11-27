class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :campaign_type,    null: false, index: true
      t.references :financial_year,   null: false, index: true
      t.references :user,             null: false, index: true
      t.references :vendor,           null: false, index: true
      
      t.money :amount,                null: false, index: true
      t.date :contract_date,          null: false, index: true
      t.text :contract_number
      t.text :campaign_name,          null: false

      t.timestamps
    end
  end
end
