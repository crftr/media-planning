class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.references :client,   null: false, index: true
      t.text :name,           null: false
      t.text :url
      t.text :phone
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
