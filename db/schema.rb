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

ActiveRecord::Schema.define(version: 20171217204813) do

  create_table "bams", force: :cascade do |t|
    t.string "model", null: false
    t.string "last_owner", default: "first owner", null: false
    t.text "imei", null: false
    t.integer "price", null: false
    t.string "type", default: "new", null: false
    t.boolean "available", default: true, null: false
    t.datetime "last_assign_at", default: "2017-12-17 23:00:25", null: false
    t.integer "sim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sim_id"], name: "index_bams_on_sim_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request", null: false
    t.string "type", null: false
    t.binary "contract"
    t.binary "file"
    t.string "status", default: "created", null: false
    t.text "comment"
    t.datetime "closed_at", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "sims", force: :cascade do |t|
    t.integer "phone_number", null: false
    t.string "last_owner", default: "first owner", null: false
    t.string "type", default: "new", null: false
    t.boolean "available", default: true, null: false
    t.datetime "last_assign_at", default: "2017-12-17 23:00:25", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smartphones", force: :cascade do |t|
    t.string "model", null: false
    t.string "category", null: false
    t.string "last_owner", default: "first owner", null: false
    t.text "imei", null: false
    t.integer "price", null: false
    t.string "type", default: "new", null: false
    t.boolean "available", default: true, null: false
    t.datetime "last_assign_at", default: "2017-12-17 23:00:25", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bam_id"], name: "index_user_records_on_bam_id"
    t.index ["sim_id"], name: "index_user_records_on_sim_id"
    t.index ["smartphone_id"], name: "index_user_records_on_smartphone_id"
    t.index ["user_id"], name: "index_user_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "rut", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "occupation", null: false
    t.string "enterprice"
    t.string "supervisor", null: false
    t.string "cost_center"
    t.string "job_center"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
