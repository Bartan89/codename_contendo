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

ActiveRecord::Schema.define(version: 2019_12_03_154048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "img"
    t.string "color"
    t.bigint "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_choices_on_format_id"
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icons", force: :cascade do |t|
    t.text "json"
    t.bigint "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_icons_on_format_id"
  end

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

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "translation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["translation_id"], name: "index_requests_on_translation_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.integer "amount"
    t.bigint "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_scenes_on_format_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "shepherd_id"
    t.integer "engagement", default: 0
    t.index ["shepherd_id"], name: "index_videos_on_shepherd_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  create_table "videos_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_videos_tags_on_tag_id"
    t.index ["video_id"], name: "index_videos_tags_on_video_id"
  end

  add_foreign_key "choices", "formats"
  add_foreign_key "icons", "formats"
  add_foreign_key "lines", "translations"
  add_foreign_key "notifications", "translations"
  add_foreign_key "requests", "translations"
  add_foreign_key "requests", "users"
  add_foreign_key "scenes", "formats"
  add_foreign_key "translations", "users"
  add_foreign_key "translations", "videos"
  add_foreign_key "videos", "users"
  add_foreign_key "videos", "users", column: "shepherd_id"
  add_foreign_key "videos_tags", "tags"
  add_foreign_key "videos_tags", "videos"
end
