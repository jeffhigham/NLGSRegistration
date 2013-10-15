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

ActiveRecord::Schema.define(version: 20131014233242) do

  create_table "companies", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "division"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_id"
  end

  create_table "company_industries", force: true do |t|
    t.integer  "company_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_types", force: true do |t|
    t.string "class_name"
    t.string "description"
  end

  create_table "contacts", force: true do |t|
    t.integer  "company_id"
    t.boolean  "primary_contact"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "industries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pop_spaces", force: true do |t|
    t.string   "display_type"
    t.text     "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prototype_spaces", force: true do |t|
    t.string   "display_type"
    t.text     "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: true do |t|
    t.string   "registration_id"
    t.string   "payment_status"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "via_sponsor"
    t.integer  "pop_spaces"
    t.string   "pop_display_type"
    t.integer  "proto_spaces"
    t.string   "proto_display_type"
    t.string   "lg_priorities"
    t.string   "pet_priorities"
    t.boolean  "acknowledgement",         default: false
    t.boolean  "vendor_loyalty_discount", default: false
    t.boolean  "pay_in_full",             default: true
    t.string   "payment_method",          default: "credit_card"
  end

end
