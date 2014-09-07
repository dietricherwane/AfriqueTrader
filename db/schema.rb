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

ActiveRecord::Schema.define(version: 20140817100357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advice_categories", force: true do |t|
    t.string   "name",       limit: 50
    t.integer  "created_by"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advices", force: true do |t|
    t.integer  "advice_category_id"
    t.integer  "company_id"
    t.string   "title",              limit: 200
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_categories", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.integer  "article_category_id"
    t.string   "title",                  limit: 200
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "audit_firms", force: true do |t|
    t.integer  "country_id"
    t.string   "name",                   limit: 50
    t.text     "informations"
    t.string   "address",                limit: 100
    t.string   "phone_number",           limit: 15
    t.string   "fax_number",             limit: 15
    t.string   "email",                  limit: 50
    t.string   "website",                limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "published"
    t.string   "audit_firm_id",          limit: 50
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "audit_reports", force: true do |t|
    t.integer  "company_id"
    t.integer  "audit_firm_id"
    t.text     "description"
    t.integer  "year"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "report_file_name"
    t.string   "report_content_type"
    t.integer  "report_file_size"
    t.datetime "report_updated_at"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "auditors", force: true do |t|
    t.string   "uuid",                   limit: 50
    t.integer  "audit_firm_id"
    t.integer  "country_id"
    t.string   "position",               limit: 100
    t.string   "firstname",              limit: 50
    t.string   "lastname",               limit: 100
    t.string   "phone_number",           limit: 20
    t.string   "email",                  limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "published"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "companies", force: true do |t|
    t.string   "sticker",                limit: 50
    t.integer  "sales_area_id"
    t.integer  "country_id"
    t.string   "name",                   limit: 50
    t.text     "description"
    t.string   "address",                limit: 100
    t.string   "phone_number",           limit: 15
    t.string   "fax_number",             limit: 15
    t.string   "email",                  limit: 50
    t.string   "website",                limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "published"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "company_events", force: true do |t|
    t.string   "title",                  limit: 200
    t.text     "description"
    t.string   "location",               limit: 200
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "company_id"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code",       limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "investment_companies", force: true do |t|
    t.integer  "investment_company_category_id"
    t.float    "selling_amount"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "published"
    t.integer  "social_status_id"
    t.string   "email",                          limit: 100
    t.text     "phone_number"
    t.text     "fax_number"
    t.string   "website",                        limit: 100
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sgo_id"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "investment_company_categories", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "link_company_to_audit_firms", force: true do |t|
    t.integer  "company_id"
    t.integer  "audit_firm_id"
    t.integer  "year"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name",       limit: 50
    t.string   "shortcut",   limit: 5
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_categories", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.integer  "publication_category_id"
    t.string   "title",                   limit: 200
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "sales_areas", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sgo_managers", force: true do |t|
    t.string   "firstname",              limit: 100
    t.string   "lastname",               limit: 100
    t.string   "position",               limit: 100
    t.string   "phone_number",           limit: 16
    t.string   "mobile_number",          limit: 16
    t.string   "email",                  limit: 100
    t.boolean  "published"
    t.integer  "sgo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "sgos", force: true do |t|
    t.string   "name",                   limit: 100
    t.date     "created_date"
    t.float    "capital"
    t.string   "email",                  limit: 100
    t.integer  "social_status_id"
    t.integer  "user_id"
    t.string   "phone_number",           limit: 16
    t.string   "fax_number",             limit: 16
    t.string   "website",                limit: 100
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified"
    t.integer  "verified_by"
    t.datetime "verified_at"
    t.boolean  "verified_by_manager"
    t.integer  "verified_by_manager_id"
    t.datetime "verified_by_manager_at"
  end

  create_table "social_statuses", force: true do |t|
    t.string   "name",       limit: 50
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_periods", force: true do |t|
    t.integer  "amount"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "subscription_period_id"
    t.integer  "user_id"
    t.boolean  "enabled"
    t.datetime "starting_at"
    t.integer  "disabled_by"
    t.datetime "disabled_at"
    t.datetime "enabled_at"
    t.integer  "enabled_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                    default: 10
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.integer  "profile_id"
    t.boolean  "published"
    t.integer  "social_status_id"
    t.string   "trading_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name",           limit: 100
    t.integer  "created_by"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wysihat_files", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
