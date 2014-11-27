class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.references :user,   null: false, index: true
      t.text :name,         null: false
      t.boolean :private,   null: false, default: true

      t.timestamps
    end
  end
end
