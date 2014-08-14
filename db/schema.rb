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

ActiveRecord::Schema.define(version: 20140814134757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "item_number"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "page_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.boolean  "approved",   default: false, null: false
    t.boolean  "notified",   default: false
  end

  add_index "comments", ["page_id"], name: "index_comments_on_page_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "page_states", force: true do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
    t.string   "categories"
  end

  add_index "page_states", ["page_id"], name: "index_page_states_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
    t.integer  "lock_version"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree
  add_index "pages", ["title"], name: "index_pages_on_title", unique: true, using: :btree

  create_table "related_collection_items", force: true do |t|
    t.integer  "source_collection_item_id"
    t.string   "relation_type"
    t.integer  "target_collection_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_usages", force: true do |t|
    t.integer "page_id"
    t.integer "resource_id"
  end

  add_index "resource_usages", ["page_id"], name: "index_resource_usages_on_page_id", using: :btree
  add_index "resource_usages", ["resource_id"], name: "index_resource_usages_on_resource_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "file"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "copyright_holder"
    t.string   "licence"
    t.string   "source"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "lock_version"
  end

  create_table "subscriptions", force: true do |t|
    t.integer "page_id"
    t.integer "user_id"
  end

  add_index "subscriptions", ["page_id"], name: "index_subscriptions_on_page_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "titles", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "titleable_id"
    t.string   "titleable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "titles", ["slug"], name: "index_titles_on_slug", unique: true, using: :btree
  add_index "titles", ["title"], name: "index_titles_on_title", unique: true, using: :btree
  add_index "titles", ["titleable_type", "titleable_id"], name: "index_titles_on_titleable_type_and_titleable_id", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "type"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "remember_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.integer  "version_number"
    t.string   "versioned_type"
    t.integer  "versioned_id"
    t.integer  "user_id"
    t.text     "description"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["created_at"], name: "index_versions_on_created_at", using: :btree
  add_index "versions", ["user_id"], name: "index_versions_on_user_id", using: :btree
  add_index "versions", ["version_number"], name: "index_versions_on_version_number", using: :btree
  add_index "versions", ["versioned_type", "versioned_id"], name: "index_versions_on_versioned_type_and_versioned_id", using: :btree

end
