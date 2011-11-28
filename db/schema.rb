# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111204193636) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "plataform"
    t.string   "media_type"
    t.integer  "media_count"
    t.string   "genre"
    t.string   "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repository_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "description"
    t.string   "review"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repository_items", ["game_id"], :name => "index_repository_items_on_game_id"
  add_index "repository_items", ["user_id", "game_id"], :name => "index_repository_items_on_user_id_and_game_id", :unique => true
  add_index "repository_items", ["user_id"], :name => "index_repository_items_on_user_id"

  create_table "reputations", :force => true do |t|
    t.integer  "reputer_id"
    t.integer  "reputed_id"
    t.string   "review"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sells", :force => true do |t|
    t.integer  "repository_item_id"
    t.integer  "buyer_id"
    t.string   "description"
    t.float    "value"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sells", ["buyer_id"], :name => "index_sells_on_buyer_id"
  add_index "sells", ["repository_item_id"], :name => "index_sells_on_repository_item_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "encrypted_password"
    t.string   "rg"
    t.string   "cpf"
    t.date     "birth_date"
    t.integer  "gender"
    t.string   "phone"
    t.string   "zipcode"
    t.string   "state"
    t.string   "city"
    t.string   "area"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              :default => false
  end

  create_table "wishlist_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishlist_items", ["game_id"], :name => "index_wishlist_items_on_game_id"
  add_index "wishlist_items", ["user_id", "game_id"], :name => "index_wishlist_items_on_user_id_and_game_id", :unique => true
  add_index "wishlist_items", ["user_id"], :name => "index_wishlist_items_on_user_id"

end
