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

ActiveRecord::Schema.define(version: 2022_06_20_170242) do

  create_table "areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_barns_on_area_id"
  end

  create_table "blocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "No"
    t.bigint "barn_id", null: false
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barn_id"], name: "index_blocks_on_barn_id"
  end

  create_table "disease_entries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "treatment_id", null: false
    t.bigint "disease_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disease_tag_id"], name: "index_disease_entries_on_disease_tag_id"
    t.index ["treatment_id"], name: "index_disease_entries_on_treatment_id"
  end

  create_table "disease_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individual_tag_entries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "individual_id", null: false
    t.bigint "individual_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["individual_id"], name: "index_individual_tag_entries_on_individual_id"
    t.index ["individual_tag_id"], name: "index_individual_tag_entries_on_individual_tag_id"
  end

  create_table "individual_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individuals", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date_of_birth"
    t.integer "sex", default: 0
    t.integer "category", default: 0
    t.integer "breed_type", default: 0
    t.boolean "shipped", default: false
    t.string "mother_id"
    t.string "father_name"
    t.string "grandfather_name"
    t.string "grand_grandfather_name"
    t.date "date_of_introduction"
    t.bigint "block_id", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_individuals_on_block_id"
  end

  create_table "medicine_entries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "treatment_id", null: false
    t.bigint "medicine_tag_id", null: false
    t.float "amount", null: false
    t.integer "amount_type", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medicine_tag_id"], name: "index_medicine_entries_on_medicine_tag_id"
    t.index ["treatment_id"], name: "index_medicine_entries_on_treatment_id"
  end

  create_table "medicine_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "symptom_entries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "treatment_id", null: false
    t.bigint "symptom_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symptom_tag_id"], name: "index_symptom_entries_on_symptom_tag_id"
    t.index ["treatment_id"], name: "index_symptom_entries_on_treatment_id"
  end

  create_table "symptom_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transfer_entries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "transfer_id", null: false
    t.string "individual_id", null: false
    t.integer "prev_block_id"
    t.integer "after_block_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["after_block_id"], name: "index_transfer_entries_on_after_block_id"
    t.index ["individual_id"], name: "index_transfer_entries_on_individual_id"
    t.index ["prev_block_id", "after_block_id"], name: "index_transfer_entries_on_prev_block_id_and_after_block_id", unique: true
    t.index ["prev_block_id"], name: "index_transfer_entries_on_prev_block_id"
    t.index ["transfer_id"], name: "index_transfer_entries_on_transfer_id"
  end

  create_table "transfers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "treat_check_tables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "treatment_id", null: false
    t.integer "stool", default: 0
    t.integer "feed", default: 0
    t.integer "cough", default: 0
    t.integer "nose", default: 0
    t.integer "condition", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_id"], name: "index_treat_check_tables_on_treatment_id"
  end

  create_table "treat_comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "treatment_id", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_id"], name: "index_treat_comments_on_treatment_id"
    t.index ["user_id"], name: "index_treat_comments_on_user_id"
  end

  create_table "treatments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "individual_id", null: false
    t.datetime "datetime"
    t.float "body_temperature"
    t.text "symptom"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["individual_id"], name: "index_treatments_on_individual_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: true
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.string "admin"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "barns", "areas"
  add_foreign_key "blocks", "barns"
  add_foreign_key "disease_entries", "disease_tags"
  add_foreign_key "disease_entries", "treatments"
  add_foreign_key "individual_tag_entries", "individual_tags"
  add_foreign_key "individual_tag_entries", "individuals"
  add_foreign_key "individuals", "blocks"
  add_foreign_key "medicine_entries", "medicine_tags"
  add_foreign_key "medicine_entries", "treatments"
  add_foreign_key "symptom_entries", "symptom_tags"
  add_foreign_key "symptom_entries", "treatments"
  add_foreign_key "transfer_entries", "individuals"
  add_foreign_key "transfer_entries", "transfers"
  add_foreign_key "treat_check_tables", "treatments"
  add_foreign_key "treat_comments", "treatments"
  add_foreign_key "treat_comments", "users"
  add_foreign_key "treatments", "individuals"
  add_foreign_key "treatments", "users"
end
