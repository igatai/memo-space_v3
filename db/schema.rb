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

ActiveRecord::Schema.define(version: 2020_07_28_143911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.boolean "allday"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.string "title", null: false
    t.string "text"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_memos_on_event_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "tag_memos", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "memo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memo_id"], name: "index_tag_memos_on_memo_id"
    t.index ["tag_id"], name: "index_tag_memos_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "folder_id"
    t.index ["folder_id"], name: "index_tags_on_folder_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "memos", "users"
  add_foreign_key "tag_memos", "memos"
  add_foreign_key "tag_memos", "tags"
  add_foreign_key "tags", "folders"
  add_foreign_key "tags", "users"
end
