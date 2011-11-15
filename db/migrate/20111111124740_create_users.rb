class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :nickname
      t.string :encrypted_password
      t.string :rg
      t.string :cpf
      t.date :birth_date
      t.integer :gender
      t.string :phone
      t.string :zipcode
      t.string :state
      t.string :city
      t.string :area
      t.string :street
      t.string :number
      t.string :complement
      t.string :salt

      t.timestamps
    end
    add_column :users, :admin, :boolean, :default => false
  end
end
