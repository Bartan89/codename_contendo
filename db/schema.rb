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

ActiveRecord::Schema.define(version: 2019_11_26_144355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "img"
    t.bigint "translation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id"], name: "index_lines_on_translation_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "translation_id"
    t.boolean "viewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id"], name: "index_notifications_on_translation_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.string "language"
    t.string "json"
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_translations_on_user_id"
    t.index ["video_id"], name: "index_translations_on_video_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "video_path"
    t.string "project_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "shephard_id"
    t.index ["shephard_id"], name: "index_videos_on_shephard_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "lines", "translations"
  add_foreign_key "notifications", "translations"
  add_foreign_key "translations", "users"
  add_foreign_key "translations", "videos"
  add_foreign_key "videos", "users"
  add_foreign_key "videos", "users", column: "shephard_id"
end
