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

ActiveRecord::Schema.define(version: 20151109023315) do

  create_table "recipe_ingredients", force: :cascade do |t|
    t.string   "ingredient_name"
    t.integer  "ingredient_number"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_ingredients", ["ingredient_name"], name: "index_recipe_ingredients_on_ingredient_name"

  create_table "recipe_steps", force: :cascade do |t|
    t.string   "step_name"
    t.integer  "step_number"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_steps", ["step_name"], name: "index_recipe_steps_on_step_name"

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.string   "publication_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["author"], name: "index_recipes_on_author"
  add_index "recipes", ["title"], name: "index_recipes_on_title"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
