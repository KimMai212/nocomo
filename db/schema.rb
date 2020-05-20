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

ActiveRecord::Schema.define(version: 2020_05_18_174006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "component_styles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "style_id", null: false
    t.bigint "component_id", null: false
    t.index ["component_id"], name: "index_component_styles_on_component_id"
    t.index ["style_id"], name: "index_component_styles_on_style_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.text "html"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "placeholders", force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "component_id", null: false
    t.index ["component_id"], name: "index_placeholders_on_component_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "layout_id", null: false
    t.index ["layout_id"], name: "index_projects_on_layout_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.text "css"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "layout_id", null: false
    t.index ["layout_id"], name: "index_styles_on_layout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "component_styles", "components"
  add_foreign_key "component_styles", "styles"
  add_foreign_key "placeholders", "components"
  add_foreign_key "projects", "layouts"
  add_foreign_key "projects", "users"
  add_foreign_key "styles", "layouts"
end
