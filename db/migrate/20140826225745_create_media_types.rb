class CreateMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_types do |t|
      t.references :user,                index: true
      t.boolean :global,    null: false, index: true, default: false
      t.text :name,         null: false
      t.integer :display_order

      t.timestamps
    end
  end
end
