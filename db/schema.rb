# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_16_081709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.string "name"
    t.string "img_url"
    t.index ["tournament_id"], name: "index_competitors_on_tournament_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "group"
    t.boolean "finished"
    t.integer "away_score"
    t.integer "home_score"
    t.datetime "local_date"
    t.integer "matchday"
    t.string "match_type"
    t.bigint "tournament_id", null: false
    t.bigint "away_competitor_id"
    t.bigint "home_competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_competitor_id"], name: "index_matches_on_away_competitor_id"
    t.index ["home_competitor_id"], name: "index_matches_on_home_competitor_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sweepstake_id", null: false
    t.boolean "paid", default: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competitor_id"
    t.index ["competitor_id"], name: "index_participants_on_competitor_id"
    t.index ["sweepstake_id"], name: "index_participants_on_sweepstake_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "sweepstakes", force: :cascade do |t|
    t.string "name"
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.integer "prize"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.index ["tournament_id"], name: "index_sweepstakes_on_tournament_id"
    t.index ["user_id"], name: "index_sweepstakes_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competitors", "tournaments"
  add_foreign_key "matches", "competitors", column: "away_competitor_id"
  add_foreign_key "matches", "competitors", column: "home_competitor_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "participants", "competitors"
  add_foreign_key "participants", "sweepstakes"
  add_foreign_key "participants", "users"
  add_foreign_key "sweepstakes", "tournaments"
  add_foreign_key "sweepstakes", "users"
end
