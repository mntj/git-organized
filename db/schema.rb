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

ActiveRecord::Schema.define(version: 20140730172748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: true do |t|
    t.string   "commiter_name"
    t.text     "message"
    t.datetime "date"
    t.string   "sha"
    t.string   "url"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "notes", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "repos", force: true do |t|
    t.string   "name"
    t.datetime "birthday"
    t.string   "commits_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "resource_items", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "todo_items", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.text     "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "github_email"
    t.string   "github_profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",              null: false
    t.string   "crypted_password",   null: false
    t.string   "salt",               null: false
    t.string   "github_username"
    t.string   "repos_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
