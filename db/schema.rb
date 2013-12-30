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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131230041759) do

  create_table "contestants", force: true do |t|
    t.integer  "first_name_id"
    t.integer  "middle_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contestants", ["first_name_id", "middle_name_id"], name: "index_contestants_on_first_name_id_and_middle_name_id", unique: true

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.integer  "winning_contestant_id"
    t.integer  "losing_contestant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "names", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "is_first_name"
    t.boolean  "is_middle_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "names", ["user_id", "name"], name: "index_names_on_user_id_and_name", unique: true

  create_table "standings", force: true do |t|
    t.integer  "user_id"
    t.integer  "contestant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "standings", ["user_id", "contestant_id"], name: "index_standings_on_user_id_and_contestant_id", unique: true

  create_table "users", force: true do |t|
    t.text     "email_address"
    t.string   "last_name"
    t.string   "url_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email_address"], name: "index_users_on_email_address", unique: true
  add_index "users", ["url_token"], name: "index_users_on_url_token", unique: true

end
