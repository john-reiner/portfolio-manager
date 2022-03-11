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

ActiveRecord::Schema[7.0].define(version: 2022_03_11_124042) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_messages_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "welcome_message"
    t.text "about_me_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about_photo"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.string "name"
    t.text "description"
    t.string "github"
    t.string "url"
    t.text "main_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_projects_on_portfolio_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_skill_categories_on_portfolio_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "skill_category_id", null: false
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  add_foreign_key "messages", "portfolios"
  add_foreign_key "projects", "portfolios"
  add_foreign_key "skill_categories", "portfolios"
  add_foreign_key "skills", "skill_categories"
end
