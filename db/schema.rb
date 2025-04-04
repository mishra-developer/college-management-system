# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_01_130518) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lacture_id"
    t.integer "status", default: 0
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lacture_id"], name: "index_attendances_on_lacture_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "class_rooms", force: :cascade do |t|
    t.string "stream"
    t.integer "NumberOFStudent"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lactures", force: :cascade do |t|
    t.string "topic", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "teacher_id"
    t.integer "class_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_lactures_on_class_room_id"
    t.index ["teacher_id"], name: "index_lactures_on_teacher_id"
  end

  create_table "leave_requests", force: :cascade do |t|
    t.date "form_date"
    t.date "to_date"
    t.text "reason"
    t.integer "leave_type", default: 0
    t.integer "request_id"
    t.integer "user_id"
    t.integer "approval_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apply_early_leave"
    t.integer "transport"
    t.index ["approval_id"], name: "index_leave_requests_on_approval_id"
    t.index ["user_id"], name: "index_leave_requests_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "securities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id"
    t.string "shift_timing_form"
    t.string "shift_timing_to"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "super_admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_number"
    t.string "route"
    t.string "type"
    t.string "college_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type '' for column 'class_room_id'


  add_foreign_key "leave_requests", "users", column: "approval_id"
end
