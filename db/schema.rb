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

ActiveRecord::Schema.define(version: 20170617135414) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "topic_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
    t.index ["topic_id"], name: "index_comments_on_topic_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_id"
    t.string   "title"
    t.integer  "credits"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "dept_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generalinfos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "dob"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_generalinfos_on_user_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.float    "salary"
    t.string   "rank"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.integer  "user_id"
    t.index ["department_id"], name: "index_lecturers_on_department_id"
    t.index ["user_id"], name: "index_lecturers_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "clicked_at"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "total_credit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "department_id"
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "takes", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_takes_on_course_id"
    t.index ["student_id"], name: "index_takes_on_student_id"
  end

  create_table "teaches", id: false, force: :cascade do |t|
    t.integer "lecturer_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_teaches_on_course_id"
    t.index ["lecturer_id"], name: "index_teaches_on_lecturer_id"
  end

  create_table "topic_scores", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "topic_id"
    t.index ["student_id"], name: "index_topic_scores_on_student_id"
    t.index ["topic_id"], name: "index_topic_scores_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_final_exam", default: false
    t.datetime "end_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "lecturer_id"
    t.integer  "course_id"
    t.integer  "duration",      default: 0
    t.index ["course_id"], name: "index_topics_on_course_id"
    t.index ["lecturer_id"], name: "index_topics_on_lecturer_id"
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
