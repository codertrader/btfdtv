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

ActiveRecord::Schema.define(version: 20131004204727) do

  create_table "accouncements", force: true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.integer  "stream_id"
    t.string   "name"
    t.string   "link"
    t.integer  "bytes"
    t.string   "icon"
    t.string   "thumbnails_64x64"
    t.string   "thumbnails_200x200"
    t.string   "thumbnails_640x480"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twitter"
    t.string   "stocktwits"
    t.string   "facebook"
    t.text     "site"
    t.text     "short_bio"
    t.text     "full_bio"
    t.integer  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "activated"
  end

  create_table "disclaimers", force: true do |t|
    t.string   "description"
    t.text     "disclaimer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editorials", force: true do |t|
    t.text     "entry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

  create_table "videos", force: true do |t|
    t.integer  "stream_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
