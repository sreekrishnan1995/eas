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

ActiveRecord::Schema.define(version: 20170921022700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appraisals", force: :cascade do |t|
    t.string "technical_skills"
    t.string "communication_skills"
    t.string "inter_personal_skills"
    t.integer "attendance"
    t.string "leadership"
    t.integer "self_rating"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_appraisals_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "emp_id"
    t.string "name"
    t.string "designation"
    t.string "superior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["emp_id"], name: "index_employees_on_emp_id", unique: true
  end

  add_foreign_key "appraisals", "employees"
end
