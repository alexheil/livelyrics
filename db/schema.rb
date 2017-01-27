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

ActiveRecord::Schema.define(version: 20151030003201) do

  create_table "albums", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "name"
    t.integer  "year"
    t.string   "cover_art_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["slug"], name: "index_albums_on_slug", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string   "artist_name"
    t.string   "artist_facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "lyric_id"
    t.integer  "user_id"
    t.string   "username"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lyric_id"], name: "index_comments_on_lyric_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["username"], name: "index_comments_on_username"
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "user_id"
    t.integer  "track_number"
    t.string   "track_name"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.index ["album_id"], name: "index_lyrics_on_album_id"
    t.index ["artist_id"], name: "index_lyrics_on_artist_id"
    t.index ["slug"], name: "index_lyrics_on_slug", unique: true
    t.index ["track_number"], name: "index_lyrics_on_track_number"
    t.index ["user_id"], name: "index_lyrics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "amazon_affiliate_id",    default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
