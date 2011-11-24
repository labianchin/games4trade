class CreateRepositoryItems < ActiveRecord::Migration
  def change
    create_table :repository_items do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :description
      t.string :review
      t.integer :grade
      t.timestamps
    end
    add_index :repository_items, :user_id
    add_index :repository_items, :game_id
    add_index :repository_items, [:user_id, :game_id], :unique => true
  end
end
