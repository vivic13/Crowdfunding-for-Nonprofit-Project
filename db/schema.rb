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

ActiveRecord::Schema.define(version: 20170504142124) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.integer  "story_id"
    t.text     "comment_body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "payment_status", default: "pending"
    t.string   "payment_method", default: "CREDIT"
    t.integer  "amount",         default: 500
    t.integer  "project_id"
    t.string   "name"
    t.index ["project_id"], name: "index_donations_on_project_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "donation_id"
    t.string   "payment_method"
    t.integer  "amount"
    t.datetime "paid_at"
    t.text     "params"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["donation_id"], name: "index_payments_on_donation_id"
  end

  create_table "photofiles", force: :cascade do |t|
    t.integer  "story_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["story_id"], name: "index_photofiles_on_story_id"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_photos_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "due_date"
    t.boolean  "is_public",       default: false
    t.boolean  "done",            default: false
    t.integer  "story_id"
    t.text     "content"
    t.integer  "total_amount"
    t.integer  "donation_amount", default: 0
  end

  create_table "report_photos", force: :cascade do |t|
    t.integer  "report_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["report_id"], name: "index_report_photos_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_public",  default: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "youtube_link"
    t.boolean  "is_public",      default: false
    t.string   "location"
    t.datetime "story_time"
    t.boolean  "priority",       default: false
    t.string   "need_project",   default: "no"
    t.text     "reflection"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "comments_count", default: 0,     null: false
    t.string   "author"
  end

  create_table "story_tags", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
