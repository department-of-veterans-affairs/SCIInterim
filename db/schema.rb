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

ActiveRecord::Schema.define(version: 20150623190643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acute_rehab1_years", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "followup_date"
    t.integer  "fim"
    t.string   "swls"
    t.string   "chart_sf"
    t.string   "sf_8"
    t.string   "place_of_residence"
  end

  create_table "acute_rehab90_days", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "followup_date"
    t.integer  "fim"
    t.string   "swls"
    t.string   "chart_sf"
    t.string   "sf_8"
    t.string   "place_of_residence"
  end

  create_table "acute_rehabs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "admission_date"
    t.integer  "start_asia"
    t.string   "start_fim"
    t.string   "start_swls"
    t.string   "start_kurtzke_edss"
    t.string   "goal_fim"
    t.date     "accute_rehab_completed"
    t.integer  "finish_asia"
    t.string   "finish_fim"
    t.string   "finish_kurtzke_edss"
    t.string   "finish_uspeq"
    t.string   "discharge_location"
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
    t.boolean  "has_motor_or_sensory_asymmetry"
    t.integer  "neuro_zone_of_preservation1"
    t.integer  "neuro_zone_of_preservation2"
    t.integer  "neuro_zone_of_preservation3"
    t.integer  "level_of_injury"
    t.integer  "asia_score"
  end

  create_table "episode_of_cares", force: true do |t|
    t.integer  "patient_id"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.date     "episode_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episode_of_cares", ["patient_id"], name: "index_episode_of_cares_on_patient_id", using: :btree

  create_table "omr1_years", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "followup_date"
    t.integer  "fim"
    t.string   "fam"
    t.string   "swls"
    t.string   "chart_sf"
    t.string   "sf_8"
    t.string   "place_of_residence"
  end

  create_table "omr90_days", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "followup_date"
    t.integer  "fim"
    t.string   "fam"
    t.string   "swls"
    t.string   "chart_sf"
    t.string   "sf_8"
    t.string   "place_of_residence"
  end

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
    t.integer  "patient_id"
    t.string   "name"
    t.string   "ssn"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sci_region"
    t.integer  "asia_level"
    t.string   "asia_impairment"
    t.string   "bladder_drainage"
    t.integer  "employment_status"
    t.integer  "highest_level_of_education"
    t.integer  "registration_status"
    t.boolean  "sci_network"
    t.date     "sci_network_date_changed"
    t.string   "type_of_etiology"
    t.string   "etiology"
    t.string   "other_etiology"
    t.date     "date_of_onset"
    t.string   "brain_injury"
    t.string   "other_injury"
    t.string   "annual_eval_vamc"
    t.string   "primary_care_vamc"
    t.string   "additional_care_vamc"
    t.string   "primary_care_provider"
    t.date     "annual_eval_received"
    t.date     "annual_eval_next_due"
    t.string   "initial_rehab_site"
    t.date     "initial_rehab_discharge"
    t.date     "date_first_seen_in_va_sci"
    t.string   "occupation_at_time_of_injury"
    t.boolean  "service_connected"
    t.date     "date_of_death"
    t.string   "outcome_coordinator"
  end

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

end
