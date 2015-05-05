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

ActiveRecord::Schema.define(version: 20150505191859) do

  create_table "avatars", force: true do |t|
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "status"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree

  create_table "cities", force: true do |t|
    t.string   "en_name"
    t.string   "ua_name"
    t.string   "ru_name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_translations", force: true do |t|
    t.integer  "city_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "en_name"
  end

  add_index "city_translations", ["city_id"], name: "index_city_translations_on_city_id", using: :btree
  add_index "city_translations", ["locale"], name: "index_city_translations_on_locale", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "description"
    t.datetime "data"
    t.time     "timeStart"
    t.time     "endTime"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "event_type"
    t.string   "people_count"
    t.string   "reg_type"
    t.integer  "city_id"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "city_name"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.integer  "avatar_id"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pictures", force: true do |t|
    t.integer  "event_id"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "status"
    t.integer  "member_id"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "turn_number"
  end

  create_table "state_translations", force: true do |t|
    t.integer  "state_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "state_translations", ["locale"], name: "index_state_translations_on_locale", using: :btree
  add_index "state_translations", ["state_id"], name: "index_state_translations_on_state_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "about_user"
    t.string   "urban"
    t.integer  "city_id"
    t.string   "language"
    t.integer  "avatar_id"
    t.datetime "birthday"
    t.string   "gender"
    t.integer  "background_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
