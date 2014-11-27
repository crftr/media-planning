class CreateFinancialYears < ActiveRecord::Migration
  def change
    create_table :financial_years do |t|
      t.references :user,   null: false, index: true
      t.text :name,         null: false
      t.date :start_date,   null: false
      t.date :end_date,     null: false

      t.timestamps

      t.index [:start_date, :end_date]
    end
  end
end
