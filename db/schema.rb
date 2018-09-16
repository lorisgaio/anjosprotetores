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

ActiveRecord::Schema.define(version: 2018_07_16_002130) do

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
    t.integer "species"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "animals", "tutors"
end
