# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_25_080902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agrovets", force: :cascade do |t|
    t.string "name"
    t.json "location"
    t.string "owner_name"
    t.integer "owner_phone"
    t.string "owner_email"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_agrovets_on_user_id"
  end

  create_table "data_entries", force: :cascade do |t|
    t.bigint "agrovet_id", null: false
    t.integer "product_1_quantity"
    t.integer "product_2_quantity"
    t.integer "product_3_quantity"
    t.integer "product_4_quantity"
    t.integer "money_paid"
    t.integer "money_owed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agrovet_id"], name: "index_data_entries_on_agrovet_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "agrovet_id", null: false
    t.integer "order_number"
    t.integer "product_1_quantity"
    t.integer "product_2_quantity"
    t.integer "product_3_quantity"
    t.integer "product_4_quantity"
    t.integer "total_amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agrovet_id"], name: "index_orders_on_agrovet_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agrovet_id"
    t.index ["agrovet_id"], name: "index_products_on_agrovet_id"
  end

  create_table "user_agrovets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agrovet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agrovet_id"], name: "index_user_agrovets_on_agrovet_id"
    t.index ["user_id"], name: "index_user_agrovets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agrovets", "users"
  add_foreign_key "data_entries", "agrovets"
  add_foreign_key "orders", "agrovets"
  add_foreign_key "products", "agrovets"
  add_foreign_key "user_agrovets", "agrovets"
  add_foreign_key "user_agrovets", "users"
end
