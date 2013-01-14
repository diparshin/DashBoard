class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, :null => false
      t.references :recipient, :null => false
      t.references :item, :null => false
      t.text :body, :null => false

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
    add_index :messages, :item_id
  end
end
