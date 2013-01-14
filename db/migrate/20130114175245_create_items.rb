class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.references :user, :null => false
      t.references :image

      t.timestamps
    end
    add_index :items, :user_id
    add_index :items, :image_id
  end
end
