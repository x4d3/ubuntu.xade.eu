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

ActiveRecord::Schema.define(version: 2019_04_07_202516) do

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "avatar_url"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "oauth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youtube_downloads", force: :cascade do |t|
    t.string "url"
    t.string "status"
    t.string "error"
    t.string "filename"
    t.integer "user_id"
    t.string "uid"
    t.boolean "is_audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_youtube_downloads_on_uid"
    t.index ["user_id"], name: "index_youtube_downloads_on_user_id"
  end

  create_table "youtube_videos", force: :cascade do |t|
    t.string "url"
    t.string "status"
    t.string "error"
    t.integer "user_id"
    t.string "filename"
    t.boolean "is_audio"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_youtube_videos_on_slug"
    t.index ["user_id"], name: "index_youtube_videos_on_user_id"
  end

end
