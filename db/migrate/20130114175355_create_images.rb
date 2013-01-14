class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :item, :null => false
      t.string :filename, :null => false
      t.integer :order

      t.timestamps
    end
    add_index :images, :item_id
  end
end
