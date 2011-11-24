class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.integer :reputer_id
      t.integer :reputed_id
      t.string :review
      t.integer :points

      t.timestamps
    end
  end
end
