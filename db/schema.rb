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

ActiveRecord::Schema.define(version: 20180426220816) do

  create_table "academic_awards", force: :cascade do |t|
    t.string "name"
    t.string "field"
    t.string "description"
    t.string "issuing_organism"
    t.date "award_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
  end

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
    t.string "admission_date"
    t.string "graduation_date"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_finished"
    t.boolean "has_degree"
    t.date "certification_date"
    t.integer "professional_license_type"
  end

  create_table "former_jobs", force: :cascade do |t|
    t.string "enterprise_name"
    t.string "phone_number"
    t.string "address"
    t.string "boss_name"
    t.string "job_title"
    t.integer "first_paycheck"
    t.integer "last_paycheck"
    t.integer "is_current_job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activities"
    t.integer "student_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "student_id"
    t.integer "job_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "category"
    t.time "workday_schedule_start"
    t.time "workday_schedule_end"
    t.string "contract_type"
    t.integer "workday_type"
    t.integer "salary"
    t.string "name"
    t.string "age_requierement"
    t.integer "gender"
    t.string "schooling_level"
    t.string "work_experience"
    t.string "specialized_knowledge"
    t.string "aptitudes"
    t.integer "job_duration"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "language_level"
    t.integer "has_certificate"
    t.string "issuing_organism"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "cell_phone_number"
    t.string "home_phone_number"
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
    t.integer "academic_level"
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
    t.index ["roleable_id"], name: "index_users_on_roleable_id"
  end

end
