class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
    add_index :wishlist_items, :user_id
    add_index :wishlist_items, :game_id
    add_index :wishlist_items, [:user_id, :game_id], :unique => true
  end
end
