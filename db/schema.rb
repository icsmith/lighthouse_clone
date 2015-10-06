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

ActiveRecord::Schema.define(version: 20151006202455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_1",          default: "",    null: false
    t.string   "address_2"
    t.string   "city",               default: "",    null: false
    t.string   "state",              default: "",    null: false
    t.string   "zip",                default: "",    null: false
    t.string   "phone",              default: "",    null: false
    t.boolean  "is_billing_address", default: false, null: false
    t.integer  "customer_id",                        null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "phone_2"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "username",               default: "", null: false
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "billing_intervals", force: :cascade do |t|
    t.string   "billing_interval_name", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "interval_month"
  end

  create_table "caseworkers", force: :cascade do |t|
    t.string   "first_name", default: "", null: false
    t.string   "last_name",  default: "", null: false
    t.string   "phone",      default: "", null: false
    t.string   "fax",        default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",                            default: "", null: false
    t.string   "last_name",                             default: "", null: false
    t.string   "middle_initial"
    t.string   "sex",                                   default: "", null: false
    t.date     "dob",                                                null: false
    t.string   "language"
    t.text     "memo"
    t.integer  "status",                                default: 1,  null: false
    t.string   "status_note"
    t.integer  "client_central_station_account_number"
    t.date     "install_date"
    t.date     "cancel_date"
    t.date     "initial_contact_autorization_date"
    t.integer  "region_id"
    t.integer  "billing_interval_id"
    t.integer  "caseworker_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.string   "insurance_name",   null: false
    t.string   "diagnostics_code"
    t.string   "venue"
    t.integer  "medicaid_number"
    t.date     "isp_end_date"
    t.integer  "customer_id",      null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "region_name", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "system_types", force: :cascade do |t|
    t.string   "system_type", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "lock_number"
    t.string   "test_call_number"
    t.date     "battery_date"
    t.date     "transponder_date"
    t.integer  "system_type_id",      null: false
    t.integer  "transponder_type_id", null: false
    t.integer  "customer_id",         null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "transponder_types", force: :cascade do |t|
    t.string   "transponder_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
