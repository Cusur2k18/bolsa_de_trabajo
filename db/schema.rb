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

ActiveRecord::Schema.define(version: 20180308013117) do

  create_table "addresses", force: :cascade do |t|
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "street"
    t.string "street_address"
    t.string "apartment_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "last_m_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_last_m_name"
    t.string "contact_employement"
    t.boolean "is_validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "activities"
    t.date "foundation_date"
    t.string "rfc"
    t.integer "category"
  end

  create_table "educations", force: :cascade do |t|
    t.string "university"
    t.string "education_level"
    t.string "major"
    t.date "admission_date"
    t.date "graduation_date"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_finished"
    t.boolean "has_degree"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "last_m_name"
    t.integer "state"
    t.string "udg_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre"
    t.integer "civil_status"
    t.date "born_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roleable_type"
    t.integer "roleable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "schedule"
    t.string "contract_type"
    t.time "shift_start"
    t.time "shift_end"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
