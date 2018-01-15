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

ActiveRecord::Schema.define(version: 20171227194658) do

  create_table "bams", force: :cascade do |t|
    t.string "model", null: false
    t.string "code", null: false
    t.string "country", null: false
    t.string "last_owner", default: "first owner", null: false
    t.string "imei", default: "000000000000000", null: false
    t.integer "price", null: false
    t.string "state", default: "new", null: false
    t.string "order_note"
    t.boolean "available", default: true, null: false
    t.datetime "renovation_at", default: "2020-01-15 17:54:48", null: false
    t.datetime "last_assign_at", default: "2018-01-15 17:54:48", null: false
    t.integer "sim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sim_id"], name: "index_bams_on_sim_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "item", null: false
    t.string "plan_type", null: false
    t.string "name", null: false
    t.string "detail"
    t.integer "price", null: false
    t.string "category", default: "all"
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "n_request"
    t.string "request", null: false
    t.string "item", null: false
    t.string "model", default: "default", null: false
    t.string "plan", default: "default", null: false
    t.binary "contract"
    t.binary "file"
    t.string "status", default: "created", null: false
    t.string "comment"
    t.string "comment_stolen_lost"
    t.string "email_sended"
    t.boolean "want_replacement"
    t.boolean "want_sim"
    t.boolean "want_new_number"
    t.string "phone_number"
    t.string "transfer_line_type"
    t.string "price"
    t.string "region"
    t.string "country"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "closed_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "sims", force: :cascade do |t|
    t.integer "phone_number", null: false
    t.integer "serial_number"
    t.string "country", null: false
    t.string "last_owner", default: "first owner", null: false
    t.string "state", default: "new", null: false
    t.boolean "available", default: true, null: false
    t.string "order_note"
    t.datetime "last_assign_at", default: "2018-01-15 17:54:48", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smartphones", force: :cascade do |t|
    t.string "model", null: false
    t.string "phone_number"
    t.string "code", null: false
    t.string "category", null: false
    t.string "country", null: false
    t.string "last_owner", default: "first owner", null: false
    t.string "imei", default: "000000000000000", null: false
    t.integer "price", null: false
    t.string "state", default: "new", null: false
    t.string "order_note"
    t.boolean "available", default: true, null: false
    t.datetime "renovation_at", default: "2020-01-15 17:54:48", null: false
    t.datetime "last_assign_at", default: "2018-01-15 17:54:48", null: false
    t.integer "sim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sim_id"], name: "index_smartphones_on_sim_id"
  end

  create_table "user_records", force: :cascade do |t|
    t.integer "smartphone_id"
    t.integer "sim_id"
    t.integer "bam_id"
    t.integer "user_id"
    t.integer "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bam_id"], name: "index_user_records_on_bam_id"
    t.index ["plan_id"], name: "index_user_records_on_plan_id"
    t.index ["sim_id"], name: "index_user_records_on_sim_id"
    t.index ["smartphone_id"], name: "index_user_records_on_smartphone_id"
    t.index ["user_id"], name: "index_user_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "national_id", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "country", null: false
    t.string "jobtitle", null: false
    t.string "job_family", null: false
    t.string "company", null: false
    t.string "supervisor"
    t.string "supervisor_email"
    t.string "supervisor_jobtitle"
    t.string "jobcode"
    t.string "location", null: false
    t.string "deptname", null: false
    t.integer "smartphone_id"
    t.integer "bam_id"
    t.integer "sim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bam_id"], name: "index_users_on_bam_id"
    t.index ["sim_id"], name: "index_users_on_sim_id"
    t.index ["smartphone_id"], name: "index_users_on_smartphone_id"
  end

end
