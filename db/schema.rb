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

ActiveRecord::Schema.define(version: 2020_06_03_121020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "cep"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cnpj"
    t.string "uf"
    t.string "cidade"
    t.string "bairro"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.integer "role", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "delivery_points", force: :cascade do |t|
    t.string "name"
    t.string "cep"
    t.string "contact"
    t.text "comment"
    t.boolean "favourite"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uf"
    t.string "cidade"
    t.string "bairro"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.index ["user_id"], name: "index_delivery_points_on_user_id"
  end

  create_table "fabric_to_carts", force: :cascade do |t|
    t.bigint "fabric_id", null: false
    t.integer "quantity"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "delivery_point_id"
    t.index ["delivery_point_id"], name: "index_fabric_to_carts_on_delivery_point_id"
    t.index ["fabric_id"], name: "index_fabric_to_carts_on_fabric_id"
    t.index ["user_id"], name: "index_fabric_to_carts_on_user_id"
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.integer "width"
    t.integer "gramatura"
    t.string "fabric_type"
    t.string "composition"
    t.bigint "company_id", null: false
    t.integer "price"
    t.integer "shipment_time"
    t.integer "minimum_qty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_fabrics_on_company_id"
  end

  create_table "label_to_fabrics", force: :cascade do |t|
    t.bigint "label_id", null: false
    t.bigint "fabric_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fabric_id"], name: "index_label_to_fabrics_on_fabric_id"
    t.index ["label_id"], name: "index_label_to_fabrics_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "companies", "users"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "delivery_points", "users"
  add_foreign_key "fabric_to_carts", "delivery_points"
  add_foreign_key "fabric_to_carts", "fabrics"
  add_foreign_key "fabric_to_carts", "users"
  add_foreign_key "fabrics", "companies"
  add_foreign_key "label_to_fabrics", "fabrics"
  add_foreign_key "label_to_fabrics", "labels"
end
