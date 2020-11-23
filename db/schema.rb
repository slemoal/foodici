# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_182058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_lines", force: :cascade do |t|
    t.integer "quantity"
    t.integer "subtotal_price_cents"
    t.bigint "product_id", null: false
    t.bigint "order_shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_shop_id"], name: "index_order_lines_on_order_shop_id"
    t.index ["product_id"], name: "index_order_lines_on_product_id"
  end

  create_table "order_shops", force: :cascade do |t|
    t.string "status"
    t.integer "subtotal_price_cents"
    t.bigint "order_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_shops_on_order_id"
    t.index ["shop_id"], name: "index_order_shops_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "starting_address"
    t.string "status"
    t.integer "total_price_cents"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "organic"
    t.integer "price_cents"
    t.integer "amount"
    t.string "unit"
    t.bigint "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "opening_hour"
    t.string "closing_hour"
    t.integer "opening_days", default: [], array: true
    t.string "phone_number"
    t.string "category"
    t.text "description"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_lines", "order_shops"
  add_foreign_key "order_lines", "products"
  add_foreign_key "order_shops", "orders"
  add_foreign_key "order_shops", "shops"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "shops"
end
