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

ActiveRecord::Schema.define(version: 20150507062834) do

  create_table "acute_rehabilitations", force: true do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.integer  "fake_sadness"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annual_evaluations", force: true do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.integer  "asia_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episode_of_cares", force: true do |t|
    t.date     "episode_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outpatient_episodes", force: true do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.integer  "fake_happiness"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.string   "ssn"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sci_region"
    t.integer  "asia_level",                   limit: 255
    t.string   "asia_impairment"
    t.string   "bladder_drainage"
    t.integer  "employment_status",            limit: 255
    t.integer  "highest_level_of_education",   limit: 255
    t.integer  "registration_status",          limit: 255
    t.boolean  "sci_network",                  limit: 255
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
    t.date     "date_first_seen_in_va_sci",    limit: 255
    t.string   "occupation_at_time_of_injury"
    t.boolean  "service_connected",            limit: 255
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
