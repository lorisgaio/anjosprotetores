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

ActiveRecord::Schema.define(version: 2018_06_24_153301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.bigint "tutor_id"
    t.datetime "date_entry"
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.string "color"
    t.integer "gender"
    t.boolean "castrated"
    t.boolean "vaccinated"
    t.boolean "dewormed"
    t.boolean "died"
    t.string "chip_n"
    t.string "veterinary"
    t.text "diagnostic"
    t.text "treatment"
    t.text "obs"
    t.datetime "adoption_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_animals_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "address"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "tutors"
end