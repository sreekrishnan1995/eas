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

ActiveRecord::Schema.define(version: 20170923210319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appraisals", force: :cascade do |t|
    t.string "emp_id"
    t.integer "attendance"
    t.integer "comm_skill"
    t.integer "tech_skill"
    t.integer "inter_skill"
    t.integer "decs_making"
    t.integer "lead_skill"
    t.boolean "verified", default: false
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "evaluated", default: false
    t.index ["emp_id"], name: "index_appraisals_on_emp_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "emp_id"
    t.string "name"
    t.string "designation"
    t.string "superior_id"
    t.decimal "curr_rating", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["emp_id"], name: "index_employees_on_emp_id", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
