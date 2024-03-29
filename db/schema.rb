# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_28_075253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bets", force: :cascade do |t|
    t.bigint "horse_id", null: false
    t.bigint "user_id", null: false
    t.bigint "race_id", null: false
    t.float "sip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["horse_id"], name: "index_bets_on_horse_id"
    t.index ["race_id"], name: "index_bets_on_race_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_participations_on_room_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "progress", default: 0
    t.index ["room_id"], name: "index_races_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "runnings", force: :cascade do |t|
    t.bigint "horse_id", null: false
    t.bigint "race_id", null: false
    t.integer "position"
    t.float "speed"
    t.float "acceleration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "rating"
    t.index ["horse_id"], name: "index_runnings_on_horse_id"
    t.index ["race_id"], name: "index_runnings_on_race_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bets", "horses"
  add_foreign_key "bets", "races"
  add_foreign_key "bets", "users"
  add_foreign_key "participations", "rooms"
  add_foreign_key "participations", "users"
  add_foreign_key "races", "rooms"
  add_foreign_key "rooms", "users"
  add_foreign_key "runnings", "horses"
  add_foreign_key "runnings", "races"
end
