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

ActiveRecord::Schema.define(version: 20190428161853) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories_products", force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "product_id",  limit: 4
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id", using: :btree
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "quantity",         limit: 4
    t.integer  "sold_quantity",    limit: 4
    t.decimal  "price",                        precision: 64, scale: 12
    t.decimal  "total_price",                  precision: 64, scale: 12
    t.decimal  "sold_total_price",             precision: 64, scale: 12
    t.string   "status",           limit: 255
    t.string   "reason",           limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "drug_name",  limit: 255
    t.integer  "quantity",   limit: 4
    t.decimal  "price",                  precision: 64, scale: 12
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "products", ["order_id"], name: "index_products_on_order_id", using: :btree

end
