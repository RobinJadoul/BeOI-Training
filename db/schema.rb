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

ActiveRecord::Schema.define(version: 20180209142112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "participation_text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "disabled"
  end

  create_table "following_subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "subject_id"
  end

  create_table "forum_messages", force: :cascade do |t|
    t.string   "text"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "subject_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "last_submissions", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "username"
    t.integer  "problem"
    t.integer  "verdict"
    t.integer  "lang"
    t.integer  "time"
    t.integer  "submit_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string   "handle"
    t.integer  "problemset_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "website"
    t.integer  "difficulty"
  end

  create_table "problemsets", force: :cascade do |t|
    t.string   "title"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "visible"
  end

  create_table "reminders", force: :cascade do |t|
    t.boolean  "reminded"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "time"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.integer  "category"
    t.boolean  "pinned"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "views"
    t.datetime "last_message_time"
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "uva"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "admin",                      null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "display_name"
    t.boolean  "is_contestant"
    t.boolean  "in_event"
    t.datetime "last_forum_visit"
    t.integer  "unread_subjects"
    t.string   "codeforces"
    t.string   "initials"
    t.boolean  "should_notify_new_subjects"
    t.string   "slack",                      limit: 21
  end

end
