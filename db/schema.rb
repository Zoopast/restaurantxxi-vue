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

ActiveRecord::Schema[7.0].define(version: 2022_11_26_203215) do
  create_table "bills", force: :cascade do |t|
    t.integer "amount", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", precision: 38, null: false
    t.integer "transaction_id", precision: 38, null: false
    t.index ["client_id"], name: "index_bills_on_client_id"
    t.index ["transaction_id"], name: "index_bills_on_transaction_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_visited"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "expense_items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", precision: 38, null: false
    t.integer "quantity", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expense_id", precision: 38, null: false
    t.index ["expense_id"], name: "index_expense_items_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "amount", precision: 38, null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "qty"
    t.string "unit", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_id", precision: 38, null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price", precision: 38
    t.integer "stock", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inventory_id", precision: 38, null: false
    t.integer "kitchen_id", precision: 38
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
    t.index ["kitchen_id"], name: "index_items_on_kitchen_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "kitchens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.boolean "default_menu", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total", precision: 38
    t.integer "client_id", precision: 38, null: false
    t.integer "table_id", precision: 38, null: false
    t.integer "reservation_id", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["reservation_id"], name: "index_orders_on_reservation_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "order_id", precision: 38, null: false
    t.integer "recipe_id", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id", precision: 38
    t.index ["bill_id"], name: "index_products_on_bill_id"
    t.index ["order_id"], name: "index_products_on_order_id"
    t.index ["recipe_id"], name: "index_products_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "preparation", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "menu_id", precision: 38, null: false
    t.integer "kitchen_id", precision: 38
    t.string "description"
    t.integer "price", precision: 38, default: 0, null: false
    t.index ["kitchen_id"], name: "index_recipes_on_kitchen_id"
    t.index ["menu_id"], name: "index_recipes_on_menu_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "reservation_datetime"
    t.integer "status", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_people", precision: 38, null: false
    t.integer "client_id", precision: 38, null: false
    t.integer "table_id", precision: 38, null: false
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["table_id"], name: "index_reservations_on_table_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "tables", force: :cascade do |t|
    t.datetime "reserved_at"
    t.integer "seats", precision: 38
    t.integer "table_number", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "date", default: "2022-11-26 20:32:33", null: false
    t.integer "transaction_type", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer "measurement", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "role_id", precision: 38
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "transactions"
  add_foreign_key "expense_items", "expenses"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "items", "inventories"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "reservations"
  add_foreign_key "orders", "tables"
  add_foreign_key "products", "orders"
  add_foreign_key "products", "recipes"
  add_foreign_key "recipes", "menus"
  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "tables"
end
