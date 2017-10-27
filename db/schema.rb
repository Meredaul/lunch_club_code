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

ActiveRecord::Schema.define(version: 20171027104941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_balances_on_group_id", using: :btree
    t.index ["user_id"], name: "index_balances_on_user_id", using: :btree
  end

  create_table "cooks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_cooks_on_group_id", using: :btree
    t.index ["user_id"], name: "index_cooks_on_user_id", using: :btree
  end

  create_table "creations", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_creations_on_group_id", using: :btree
    t.index ["user_id"], name: "index_creations_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.boolean  "all_cooks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "occurences", force: :cascade do |t|
    t.integer  "slot_time_id"
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["group_id"], name: "index_occurences_on_group_id", using: :btree
    t.index ["slot_time_id"], name: "index_occurences_on_slot_time_id", using: :btree
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_participations_on_group_id", using: :btree
    t.index ["user_id"], name: "index_participations_on_user_id", using: :btree
  end

  create_table "presences", force: :cascade do |t|
    t.boolean  "attended"
    t.boolean  "cuisto"
    t.integer  "user_id"
    t.integer  "occurence_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["occurence_id"], name: "index_presences_on_occurence_id", using: :btree
    t.index ["user_id"], name: "index_presences_on_user_id", using: :btree
  end

  create_table "slot_times", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.integer  "points"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_turns_on_group_id", using: :btree
    t.index ["user_id"], name: "index_turns_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "total_balance"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "balances", "groups"
  add_foreign_key "balances", "users"
  add_foreign_key "cooks", "groups"
  add_foreign_key "cooks", "users"
  add_foreign_key "creations", "groups"
  add_foreign_key "creations", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "occurences", "groups"
  add_foreign_key "occurences", "slot_times"
  add_foreign_key "participations", "groups"
  add_foreign_key "participations", "users"
  add_foreign_key "presences", "occurences"
  add_foreign_key "presences", "users"
  add_foreign_key "turns", "groups"
  add_foreign_key "turns", "users"
end
