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

ActiveRecord::Schema.define(:version => 20120131062223) do

  create_table "ad_store_relationships", :force => true do |t|
    t.integer  "ad_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", :force => true do |t|
    t.string   "name"
    t.string   "headline"
    t.string   "body"
    t.integer  "advertiser_id"
    t.integer  "impression_count"
    t.integer  "click_count"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertiser_developer_relationships", :force => true do |t|
    t.integer  "advertiser_id"
    t.integer  "developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisers", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisers", ["email"], :name => "index_advertisers_on_email", :unique => true
  add_index "advertisers", ["reset_password_token"], :name => "index_advertisers_on_reset_password_token", :unique => true

  create_table "clicks", :force => true do |t|
    t.string   "developer_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "user_info"
    t.integer  "ad_id"
    t.integer  "advertiser_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developers", ["email"], :name => "index_developers_on_email", :unique => true
  add_index "developers", ["reset_password_token"], :name => "index_developers_on_reset_password_token", :unique => true

  create_table "impressions", :force => true do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "developer_id"
    t.integer  "ad_id"
    t.integer  "advertiser_id"
    t.integer  "store_id"
    t.string   "user_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "state"
    t.integer  "zip"
    t.string   "city"
    t.string   "address"
    t.integer  "advertiser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
