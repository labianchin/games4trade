class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.integer :repository_item_id
      t.integer :buyer_id
      t.string :description
      t.float :value
      t.integer :status

      t.timestamps
    end
    add_index :sells, :repository_item_id, :unique => true
    add_index :sells, :buyer_id
  end
end
