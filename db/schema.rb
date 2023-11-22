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

ActiveRecord::Schema[7.1].define(version: 2023_11_22_231743) do
  create_table "listing_tags", force: :cascade do |t|
    t.integer "tags_id"
    t.integer "listings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listings_id"], name: "index_listing_tags_on_listings_id"
    t.index ["tags_id"], name: "index_listing_tags_on_tags_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "photoURL"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "seller", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listing_tags", "listings", column: "listings_id"
  add_foreign_key "listing_tags", "tags", column: "tags_id"
  add_foreign_key "listings", "users"
end
