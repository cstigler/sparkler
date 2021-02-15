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

ActiveRecord::Schema.define(version: 20160520173336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeds", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.string "name", null: false
    t.string "url", null: false
    t.boolean "public_stats", default: false, null: false
    t.boolean "public_counts", default: false, null: false
    t.text "contents"
    t.string "last_version"
    t.string "load_error"
    t.boolean "inactive", default: false, null: false
  end

  create_table "options", id: :serial, force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "name", null: false
    t.index ["property_id", "name"], name: "index_options_on_property_id_and_name", unique: true
  end

  create_table "properties", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_properties_on_name", unique: true
  end

  create_table "statistics", id: :serial, force: :cascade do |t|
    t.integer "feed_id", null: false
    t.integer "property_id", null: false
    t.integer "option_id", null: false
    t.integer "counter", default: 0, null: false
    t.date "date", null: false
    t.index ["feed_id", "date", "property_id", "option_id"], name: "stats_index", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "password_digest"
  end

end
