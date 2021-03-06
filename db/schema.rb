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

ActiveRecord::Schema.define(version: 2021_07_29_033641) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_detail", default: "?????????"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.text "content"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_from_sale"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "action"
    t.string "introduction"
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "post_user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "action"
    t.integer "post_sale_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "sale_id"
    t.string "post_title"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_image_id"
    t.integer "customer_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "sale_id"
    t.string "name"
    t.string "birthplace"
    t.string "hobby"
    t.string "recent_event"
    t.text "a_word"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sales_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sales_on_reset_password_token", unique: true
  end

end
