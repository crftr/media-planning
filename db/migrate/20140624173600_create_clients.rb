class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user,   null: false, index: true
      t.text :name,         null: false

      t.timestamps
    end
  end
end
