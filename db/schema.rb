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

ActiveRecord::Schema.define(version: 20141223060447) do

  create_table "actiontypes", force: true do |t|
    t.string   "action_type"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agencies", force: true do |t|
    t.string   "company_name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "postcode"
    t.string   "country"
    t.string   "phonenumber"
    t.text     "admin_notes"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "company_name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "postcode"
    t.string   "country"
    t.string   "phonenumber"
    t.text     "admin_notes"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "reason"
    t.integer  "user_id"
    t.integer  "value"
    t.integer  "agency_id"
    t.boolean  "lead"
    t.datetime "created_at"
    t.datetime "updated_ate"
  end

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "postcode"
    t.string   "country"
    t.string   "phonenumber"
    t.text     "admin_notes"
    t.datetime "last_login_date"
    t.string   "website_url"
    t.string   "tracking_phone_number"
    t.string   "web_design"
    t.string   "google_account"
    t.string   "google_password"
    t.string   "google_maps_status"
    t.text     "google_maps_notes"
    t.string   "google_maps_url"
    t.string   "google_verified_date"
    t.string   "youtube_channel_url"
    t.string   "bing_account"
    t.string   "bing_password"
    t.string   "bing_places_status"
    t.text     "bing_places_notes"
    t.string   "bing_places_url"
    t.string   "bing_verified_date"
    t.string   "yelp_account"
    t.string   "yelp_password"
    t.string   "yelp_status"
    t.text     "yelp_notes"
    t.string   "yelp_url"
    t.string   "yelp_verified_date"
    t.string   "yahoo_account"
    t.string   "yahoo_password"
    t.string   "yahoo_local_status"
    t.text     "yahoo_local_notes"
    t.string   "yahoo_local_url"
    t.string   "yahoo_verified_date"
    t.text     "keywords"
    t.string   "last_attempt_to_contact"
    t.boolean  "instant_call_notification"
    t.string   "package"
    t.integer  "package_price"
    t.boolean  "customer_content_survey"
    t.string   "status"
    t.string   "role"
    t.string   "level_id"
    t.boolean  "active",                    default: true
    t.integer  "brand_id"
    t.integer  "agency_id"
    t.integer  "main_contact_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: true do |t|
    t.string   "adf_email"
    t.string   "customer_code"
    t.string   "tracking_number"
    t.string   "target_number"
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_phone"
    t.string   "call_recording_link"
    t.string   "caller_phone_number"
    t.string   "duration"
    t.string   "call_status"
    t.string   "opportunity_name"
    t.string   "caller_status"
    t.string   "lead_email"
    t.string   "lead_interest"
    t.string   "lead_phone_number"
    t.string   "lead_comments"
    t.integer  "customer_id"
    t.integer  "company_id"
    t.string   "message_type"
    t.boolean  "call_answered"
    t.boolean  "is_customer"
    t.integer  "actiontype_id"
    t.integer  "non_customer_type"
    t.integer  "category_id"
    t.string   "why"
    t.integer  "reviewer_id"
    t.boolean  "notified"
    t.datetime "notified_date"
    t.boolean  "reviewed"
    t.boolean  "spam"
    t.integer  "nonleadaction_id"
    t.string   "status"
    t.string   "contractor_invoice"
    t.string   "equipment"
    t.text     "notes"
    t.string   "source"
    t.integer  "agency_id"
    t.boolean  "lead"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phonenumber"
    t.string   "password"
    t.text     "admin_notes"
    t.datetime "last_login_date"
    t.string   "status"
    t.integer  "company_id"
    t.integer  "agency_id"
    t.integer  "brand_id"
    t.boolean  "cl_user"
    t.boolean  "kinertia_employee"
    t.boolean  "active",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
