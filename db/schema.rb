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

ActiveRecord::Schema.define(version: 20150425031317) do

  create_table "patients", force: true do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.string   "ssn"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sci_region"
    t.string   "asia_level"
    t.string   "asia_impairment"
    t.string   "bladder_drainage"
    t.string   "employment_status"
    t.string   "highest_level_of_education"
    t.string   "registration_status"
    t.string   "sci_network"
    t.datetime "sci_network_date_changed"
    t.string   "type_of_etiology"
    t.string   "etiology"
    t.string   "other_etiology"
    t.datetime "date_of_onset"
    t.string   "brain_injury"
    t.string   "other_injury"
    t.string   "annual_eval_vamc"
    t.string   "primary_care_vamc"
    t.string   "additional_care_vamc"
    t.string   "primary_care_provider"
    t.datetime "annual_eval_received"
    t.datetime "annual_eval_next_due"
    t.string   "initial_rehab_site"
    t.datetime "initial_rehab_discharge"
    t.string   "data_first_seen_in_va_sci"
    t.string   "occupation_at_time_of_injury"
    t.string   "service_connected"
    t.datetime "date_of_death"
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
