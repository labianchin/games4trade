class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :plataform
      t.string :media_type
      t.integer :media_count
      t.string :genre
      t.string :review

      t.timestamps
    end
  end
end
