class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :plataform
      t.string :media
      t.string :media_count
      t.string :genre

      t.timestamps
    end
  end
end
