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

ActiveRecord::Schema.define(version: 20140903044007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertising_types", force: true do |t|
    t.integer  "user_id"
    t.integer  "media_type_id",                 null: false
    t.text     "name",                          null: false
    t.boolean  "global",        default: false, null: false
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertising_types", ["media_type_id"], name: "index_advertising_types_on_media_type_id", using: :btree
  add_index "advertising_types", ["user_id"], name: "index_advertising_types_on_user_id", using: :btree

  create_table "campaign_types", force: true do |t|
    t.integer  "user_id"
    t.boolean  "global",        default: false, null: false
    t.text     "name",                          null: false
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaign_types", ["user_id"], name: "index_campaign_types_on_user_id", using: :btree

  create_table "clients", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "contracts", force: true do |t|
    t.integer  "campaign_type_id",                  null: false
    t.integer  "financial_year_id",                 null: false
    t.integer  "user_id",                           null: false
    t.integer  "vendor_id",                         null: false
    t.integer  "amount_cents",      default: 0,     null: false
    t.string   "amount_currency",   default: "USD", null: false
    t.date     "contract_date",                     null: false
    t.text     "contract_number"
    t.text     "campaign_name",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["campaign_type_id"], name: "index_contracts_on_campaign_type_id", using: :btree
  add_index "contracts", ["financial_year_id"], name: "index_contracts_on_financial_year_id", using: :btree
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree
  add_index "contracts", ["vendor_id"], name: "index_contracts_on_vendor_id", using: :btree

  create_table "contracts_engagements", id: false, force: true do |t|
    t.integer "contract_id"
    t.integer "engagement_id"
  end

  create_table "engagements", force: true do |t|
    t.integer  "client_id",  null: false
    t.text     "name",       null: false
    t.text     "url"
    t.text     "phone"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "engagements", ["client_id"], name: "index_engagements_on_client_id", using: :btree

  create_table "financial_years", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "name",       null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "financial_years", ["start_date", "end_date"], name: "index_financial_years_on_start_date_and_end_date", using: :btree
  add_index "financial_years", ["user_id"], name: "index_financial_years_on_user_id", using: :btree

  create_table "media_types", force: true do |t|
    t.integer  "user_id"
    t.boolean  "global",        default: false, null: false
    t.text     "name",                          null: false
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "media_types", ["user_id"], name: "index_media_types_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: "",    null: false
    t.string   "organization",           default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "client_manager",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.integer  "user_id",                   null: false
    t.text     "name",                      null: false
    t.boolean  "private",    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendors", ["user_id"], name: "index_vendors_on_user_id", using: :btree

end
