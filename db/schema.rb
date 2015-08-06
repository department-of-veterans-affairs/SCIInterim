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

ActiveRecord::Schema.define(version: 20150723005742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acute_rehabs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_fim"
    t.string   "start_swls"
    t.string   "goal_fim"
    t.string   "finish_fim"
    t.integer  "reason_for_admission"
    t.string   "reason_for_admission_other"
    t.date     "hospital_admission"
    t.date     "acute_rehab_admission"
    t.date     "hospital_discharge"
    t.date     "acute_rehab_discharge"
    t.integer  "residence_type"
    t.string   "residence_name"
    t.boolean  "discharge_to_community"
    t.string   "start_sf8"
    t.string   "finish_swls"
    t.string   "finish_sf8"
    t.date     "followup_90day_date"
    t.string   "followup_90day_fim"
    t.string   "followup_90day_swls"
    t.string   "followup_90day_chart_sf"
    t.string   "followup_90day_sf8"
    t.date     "followup_1yr_date"
    t.string   "followup_1yr_fim"
    t.string   "followup_1yr_swls"
    t.string   "followup_1yr_chart_sf"
    t.string   "followup_1yr_sf8"
  end

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state"
    t.integer  "zip"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone_number"
  end

  create_table "annual_evaluations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "eval_offered"
    t.date     "eval_completed"
    t.boolean  "is_inpatient"
    t.integer  "bmi"
    t.string   "cyh"
    t.string   "fim"
    t.string   "kurtzke_edss"
    t.integer  "bladder_drainage_method"
  end

  create_table "asia", force: true do |t|
    t.integer  "classification"
    t.boolean  "is_complete"
    t.boolean  "has_motor_or_sensory_asymmetry"
    t.integer  "neurological_sensory_level_left"
    t.integer  "neurological_sensory_level_right"
    t.integer  "neurological_motor_level_left"
    t.integer  "neurological_motor_level_right"
    t.integer  "preservation_sensory_left"
    t.integer  "preservation_sensory_right"
    t.integer  "preservation_motor_left"
    t.integer  "preservation_motor_right"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "has_asia_id"
    t.string   "has_asia_type"
  end

  add_index "asia", ["has_asia_id"], name: "index_asia_on_has_asia_id", using: :btree

  create_table "episode_of_cares", force: true do |t|
    t.integer  "patient_id"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episode_of_cares", ["patient_id"], name: "index_episode_of_cares_on_patient_id", using: :btree

  create_table "omrs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "admission_date"
    t.integer  "start_asia"
    t.string   "start_fim"
    t.string   "start_fam"
    t.string   "start_swls"
    t.string   "start_chart_sf"
    t.string   "start_sf_8"
    t.string   "dusoi"
    t.string   "goal_fim"
    t.string   "goal_fam"
    t.date     "omb_completed"
    t.integer  "finish_asia"
    t.string   "finish_fim"
    t.string   "finish_fam"
    t.string   "finish_swls"
    t.string   "finish_chart_sf"
    t.string   "finish_sf_8"
    t.string   "finish_uspeq"
    t.string   "discharge_location"
  end

  create_table "patients", force: true do |t|
    t.integer  "scido_id"
    t.string   "first_name"
    t.string   "ssn"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "highest_level_of_education"
    t.string   "occupation_at_time_of_injury"
    t.string   "last_name"
    t.integer  "gender"
    t.boolean  "my_healthevet_messaging"
    t.boolean  "sci_service_connected"
    t.integer  "travel_status"
    t.date     "benefits_waiver_exemption_date"
    t.integer  "va_status"
    t.integer  "assigned_vamc"
    t.integer  "assigned_sci_hub"
    t.string   "assigned_sci_hub_physician_first_name"
    t.string   "assigned_sci_hub_physician_last_name"
    t.integer  "preferred_sci_hub"
    t.string   "preferred_sci_hub_physician_first_name"
    t.string   "preferred_sci_hub_physician_last_name"
    t.string   "non_va_facility_name"
    t.string   "non_va_facility_contact"
    t.string   "non_va_facility_phone_number"
    t.string   "non_va_facility_fax_number"
    t.string   "non_va_facility_pcp_first_name"
    t.string   "non_va_facility_pcp_last_name"
    t.string   "va_facility"
    t.string   "va_facility_pcp_first_name"
    t.string   "va_facility_pcp_last_name"
    t.integer  "theater_of_service"
    t.date     "sci_arrival_date"
    t.boolean  "is_on_active_duty"
    t.integer  "sci_type"
    t.date     "date_of_injury"
    t.string   "current_occupation"
    t.integer  "residence_type"
    t.integer  "has_caregiver"
    t.boolean  "is_receiving_non_va_care"
    t.integer  "non_va_care_hours_per_month"
    t.date     "last_fee_basis_evaluation_date"
    t.boolean  "is_receiving_hhha"
    t.integer  "address_id",                             null: false
    t.integer  "caregiver_address_id",                   null: false
    t.integer  "principle_pcp_va_nonva"
    t.integer  "scid_eligibility"
    t.string   "scid_eligibility_other"
    t.integer  "scid_etiology"
  end

  add_index "patients", ["address_id"], name: "index_patients_on_address_id", unique: true, using: :btree
  add_index "patients", ["caregiver_address_id"], name: "index_patients_on_caregiver_address_id", unique: true, using: :btree

  create_table "transfers", force: true do |t|
    t.integer  "acute_rehabs_id"
    t.date     "in"
    t.date     "out"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "transfers", ["acute_rehabs_id"], name: "index_transfers_on_acute_rehabs_id", using: :btree

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "episode_of_cares", "patients", name: "episode_of_cares_patient_id_fk"

  add_foreign_key "patients", "addresses", name: "patients_address_id_fk", dependent: :delete
  add_foreign_key "patients", "addresses", name: "patients_caregiver_address_id_fk", column: "caregiver_address_id", dependent: :delete

end
