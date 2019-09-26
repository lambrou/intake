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

ActiveRecord::Schema.define(version: 2015_06_13_100555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "lifestyle"
    t.string "sex"
    t.float "bmi", default: 0.0
    t.integer "age", default: 18
    t.float "bmr", default: 0.0
    t.integer "weight", default: 0
    t.integer "height", default: 0
    t.integer "tweight", default: 0
    t.integer "maxcal", default: 0
    t.integer "calories", default: 0
    t.integer "carbs", default: 0
    t.integer "fat", default: 0
    t.string "timezone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
