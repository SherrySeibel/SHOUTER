# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141108220301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "following_relationships", force: true do |t|
    t.integer  "followed_user_id"
    t.integer  "follower_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "following_relationships", ["followed_user_id"], name: "index_following_relationships_on_followed_user_id", using: :btree
  add_index "following_relationships", ["follower_id"], name: "index_following_relationships_on_follower_id", using: :btree

  create_table "photo_shouts", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "shouts", force: true do |t|
    t.integer  "user_id",                      null: false
    t.string   "content_type",                 null: false
    t.integer  "content_id",                   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "spam",         default: false, null: false
  end

  add_index "shouts", ["content_type", "content_id"], name: "index_shouts_on_content_type_and_content_id", using: :btree
  add_index "shouts", ["user_id"], name: "index_shouts_on_user_id", using: :btree

  create_table "text_shouts", force: true do |t|
    t.string "body", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false, null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
