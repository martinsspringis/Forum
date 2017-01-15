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

ActiveRecord::Schema.define(version: 20170115135150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "at"
    t.integer  "nyk_points"
    t.integer  "opponent_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",          default: false
    t.boolean  "reviewed",        default: false
    t.datetime "date"
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "article"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "fgm"
    t.integer  "fga"
    t.integer  "three_m"
    t.integer  "three_a"
    t.integer  "ftm"
    t.integer  "fta"
    t.integer  "eff_factor"
    t.integer  "or"
    t.integer  "reb"
    t.integer  "ast"
    t.integer  "blk"
    t.integer  "stl"
    t.integer  "to"
    t.integer  "fouls"
    t.integer  "pts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min"
    t.integer  "sec"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "number"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "from"
    t.date     "born"
    t.date     "nba_debut"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height"
    t.integer  "weight"
    t.string   "position",             limit: 2
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "author"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ancestry"
  end

  add_index "replies", ["ancestry"], name: "index_replies_on_ancestry", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.date     "established"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "name"
    t.string   "surname"
    t.string   "nickname"
    t.integer  "warnings",               default: 0
    t.boolean  "blocked",                default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "role",                   default: 1
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
