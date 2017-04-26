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

ActiveRecord::Schema.define(version: 20170426205425) do

  create_table "inventories", force: :cascade do |t|
    t.integer  "survivor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["survivor_id"], name: "index_inventories_on_survivor_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "infected_id"
    t.integer  "by_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["by_id"], name: "index_reports_on_by_id"
    t.index ["infected_id"], name: "index_reports_on_infected_id"
  end

  create_table "stacks", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "inventory_id"
    t.index ["inventory_id"], name: "index_stacks_on_inventory_id"
    t.index ["item_id"], name: "index_stacks_on_item_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "gender"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
