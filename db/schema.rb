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

ActiveRecord::Schema.define(version: 20141105190334) do

  create_table "assets", force: true do |t|
    t.integer  "vendor_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name",        limit: 255
    t.integer  "industry_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_locations", force: true do |t|
    t.integer  "vendor_id",  limit: 4
    t.integer  "city_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_links", force: true do |t|
    t.integer  "vendor_id",          limit: 4
    t.integer  "external_source_id", limit: 4
    t.string   "link",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_sources", force: true do |t|
    t.string   "source_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", force: true do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_locations", force: true do |t|
    t.string   "address",          limit: 255
    t.string   "postal_code",      limit: 255
    t.string   "business_phone",   limit: 255
    t.string   "other_phone",      limit: 255
    t.string   "fax",              limit: 255
    t.string   "business_email",   limit: 255
    t.string   "business_website", limit: 255
    t.boolean  "sale_location",    limit: 1
    t.integer  "city_id",          limit: 4
    t.integer  "vendor_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_subscriptions", force: true do |t|
    t.integer  "post_id",        limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: true do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",          limit: 255
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.boolean  "admin",             limit: 1,   default: false
    t.integer  "account_id",        limit: 4
    t.string   "account_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_subscriptions", force: true do |t|
    t.integer  "vendor_id",      limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "business_name",        limit: 255
    t.string   "business_description", limit: 255
    t.date     "establish_date"
    t.integer  "tax_number",           limit: 4
    t.boolean  "shipping",             limit: 1
    t.boolean  "verified",             limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
