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

ActiveRecord::Schema.define(version: 20170419151346) do

  create_table "courses", force: :cascade do |t|
    t.string   "course_id"
    t.string   "title"
    t.integer  "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dept_id"
    t.index ["dept_id"], name: "index_courses_on_dept_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "dept_id"
    t.string   "dept_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_id"
    t.string   "dept_id"
    t.integer  "total_credit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "is_a"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

end
