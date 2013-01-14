class CreateItemsTags < ActiveRecord::Migration
  def change
    create_table :items_tags do |t|
      t.references :item
      t.references :tag

      t.timestamp
    end

    add_index :items_tags, :item_id
    add_index :items_tags, :tag_id 
  end
end
