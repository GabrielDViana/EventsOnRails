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

ActiveRecord::Schema.define(version: 20160313164115) do

  create_table "caps", force: :cascade do |t|
    t.string   "title"
    t.string   "area"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.date     "date"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "cap_image_file_name"
    t.string   "cap_image_content_type"
    t.integer  "cap_image_file_size"
    t.datetime "cap_image_updated_at"
    t.date     "start_at"
    t.date     "end_at"
    t.time     "time_start"
    t.time     "time_end"
    t.integer  "meetings"
    t.string   "observations"
    t.string   "token"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cap_id"
  end

  add_index "participations", ["cap_id"], name: "index_participations_on_cap_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "category"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "complete_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "email_confirmed"
    t.string   "confirm_token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.date     "birthday"
    t.string   "experience"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.string   "token"
  end

end
