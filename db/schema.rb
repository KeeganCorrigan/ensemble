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

ActiveRecord::Schema.define(version: 20180718053946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_musicians", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "musician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_musicians_on_band_id"
    t.index ["musician_id"], name: "index_band_musicians_on_musician_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "genre"
  end

  create_table "iterations", force: :cascade do |t|
    t.string "content"
    t.string "recording"
    t.string "comment"
    t.bigint "musician_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.index ["musician_id"], name: "index_iterations_on_musician_id"
    t.index ["song_id"], name: "index_iterations_on_song_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "profile"
    t.string "instrument"
    t.integer "role", default: 0
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "band_id"
    t.string "title"
    t.string "timing"
    t.string "genre"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_songs_on_band_id"
  end

  add_foreign_key "band_musicians", "bands"
  add_foreign_key "band_musicians", "musicians"
  add_foreign_key "iterations", "musicians"
  add_foreign_key "iterations", "songs"
  add_foreign_key "songs", "bands"
end
