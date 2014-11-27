class CreateAdvertisingTypes < ActiveRecord::Migration
  def change
    create_table :advertising_types do |t|
      t.references :user,                    index: true
      t.references :media_type, null: false, index: true
      t.text :name,             null: false
      t.boolean :global,        null: false, index: true, default: false
      t.integer :display_order

      t.timestamps
    end
  end
end
