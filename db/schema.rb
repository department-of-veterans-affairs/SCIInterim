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

ActiveRecord::Schema.define(version: 20150813215144) do

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
    t.integer  "zip"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone_number"
    t.string   "state"
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

  create_table "domain_asia_classifications", force: true do |t|
    t.string "name"
  end

  create_table "domain_bladder_drainage_methods", force: true do |t|
    t.string "name"
  end

  create_table "domain_caregiver_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_admission_classes", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_communication_comprehension_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_communication_expression_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_impairment_categories", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_impairment_groups", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_locomotion_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_fim_measurements", force: true do |t|
    t.string "name"
  end

  create_table "domain_genders", force: true do |t|
    t.string "name"
  end

  create_table "domain_highest_level_of_educations", force: true do |t|
    t.string "name"
  end

  create_table "domain_level_of_injuries", force: true do |t|
    t.string "name"
  end

  create_table "domain_occupations", force: true do |t|
    t.string "name"
  end

  create_table "domain_principle_pcp_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_reason_for_admissions", force: true do |t|
    t.string "name"
  end

  create_table "domain_residence_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_sci_types", force: true do |t|
    t.string "name"
  end

  create_table "domain_scid_eligibilities", force: true do |t|
    t.string "name"
  end

  create_table "domain_scid_etiologies", force: true do |t|
    t.string "name"
  end

  create_table "domain_theater_of_services", force: true do |t|
    t.string "name"
  end

  create_table "domain_travel_statuses", force: true do |t|
    t.string "name"
  end

  create_table "domain_va_medical_centers", force: true do |t|
    t.string "name"
  end

  create_table "domain_va_statuses", force: true do |t|
    t.string "name"
  end

  create_table "episode_of_cares", force: true do |t|
    t.integer  "patient_id"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episode_of_cares", ["patient_id"], name: "index_episode_of_cares_on_patient_id", using: :btree

  create_table "fim_measurements", force: true do |t|
    t.integer  "eating"
    t.integer  "grooming"
    t.integer  "bathing"
    t.integer  "dressing_upper"
    t.integer  "dressing_lower"
    t.integer  "toileting"
    t.integer  "bladder_management"
    t.integer  "bowel_management"
    t.integer  "transfer_bed_chair_wheelchair"
    t.integer  "transfer_toilet"
    t.integer  "transfer_tub_shower"
    t.integer  "locomotion_walk_wheelchar"
    t.integer  "locomotion_stairs"
    t.integer  "communication_comprehension"
    t.integer  "communication_expression"
    t.integer  "social_cognition_social_interaction"
    t.integer  "social_cognition_problem_solving"
    t.integer  "social_cognition_memory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fims", force: true do |t|
    t.boolean  "is_active_duty"
    t.integer  "admission_class"
    t.boolean  "is_program_interrupted"
    t.integer  "impairment_category"
    t.integer  "impairment_group"
    t.integer  "measurements_start"
    t.integer  "measurements_goal"
    t.integer  "measurements_finish"
    t.integer  "measurements_90day"
    t.integer  "measurements_1year"
    t.integer  "locomotion_type"
    t.integer  "communication_comprehension_type"
    t.integer  "communication_expression_type"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "scido_id"
    t.string   "first_name"
    t.string   "ssn"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "highest_level_of_education"
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
    t.integer  "residence_type"
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
    t.integer  "occupation_at_time_of_injury"
    t.integer  "current_occupation"
    t.string   "caregiver_first_name"
    t.string   "caregiver_last_name"
    t.integer  "caregiver_type"
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

  add_foreign_key "acute_rehabs", "domain_reason_for_admissions", name: "acute_rehabs_reason_for_admission_fk", column: "reason_for_admission"
  add_foreign_key "acute_rehabs", "domain_residence_types", name: "acute_rehabs_residence_type_fk", column: "residence_type"

  add_foreign_key "annual_evaluations", "domain_bladder_drainage_methods", name: "annual_evaluations_bladder_drainage_method_fk", column: "bladder_drainage_method"

  add_foreign_key "asia", "domain_asia_classifications", name: "asia_classification_fk", column: "classification"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_neurological_motor_level_left_fk", column: "neurological_motor_level_left"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_neurological_motor_level_right_fk", column: "neurological_motor_level_right"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_neurological_sensory_level_left_fk", column: "neurological_sensory_level_left"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_neurological_sensory_level_right_fk", column: "neurological_sensory_level_right"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_preservation_motor_left_fk", column: "preservation_motor_left"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_preservation_motor_right_fk", column: "preservation_motor_right"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_preservation_sensory_left_fk", column: "preservation_sensory_left"
  add_foreign_key "asia", "domain_level_of_injuries", name: "asia_preservation_sensory_right_fk", column: "preservation_sensory_right"

  add_foreign_key "episode_of_cares", "patients", name: "episode_of_cares_patient_id_fk"

  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_bathing_fk", column: "bathing"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_bladder_management_fk", column: "bladder_management"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_bowel_management_fk", column: "bowel_management"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_communication_comprehension_fk", column: "communication_comprehension"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_communication_expression_fk", column: "communication_expression"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_dressing_lower_fk", column: "dressing_lower"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_dressing_upper_fk", column: "dressing_upper"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_eating_fk", column: "eating"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_grooming_fk", column: "grooming"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_locomotion_stairs_fk", column: "locomotion_stairs"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_locomotion_walk_wheelchar_fk", column: "locomotion_walk_wheelchar"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_social_cognition_memory_fk", column: "social_cognition_memory"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_social_cognition_problem_solving_fk", column: "social_cognition_problem_solving"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_social_cognition_social_interaction_fk", column: "social_cognition_social_interaction"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_toileting_fk", column: "toileting"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_transfer_bed_chair_wheelchair_fk", column: "transfer_bed_chair_wheelchair"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_transfer_toilet_fk", column: "transfer_toilet"
  add_foreign_key "fim_measurements", "domain_fim_measurements", name: "fim_measurements_transfer_tub_shower_fk", column: "transfer_tub_shower"

  add_foreign_key "fims", "domain_fim_admission_classes", name: "fims_admission_class_fk", column: "admission_class"
  add_foreign_key "fims", "domain_fim_communication_comprehension_types", name: "fims_communication_comprehension_type_fk", column: "communication_comprehension_type"
  add_foreign_key "fims", "domain_fim_communication_expression_types", name: "fims_communication_expression_type_fk", column: "communication_expression_type"
  add_foreign_key "fims", "domain_fim_impairment_categories", name: "fims_impairment_category_fk", column: "impairment_category"
  add_foreign_key "fims", "domain_fim_impairment_groups", name: "fims_impairment_group_fk", column: "impairment_group"
  add_foreign_key "fims", "domain_fim_locomotion_types", name: "fims_locomotion_type_fk", column: "locomotion_type"
  add_foreign_key "fims", "fim_measurements", name: "fims_measurements_1year_fk", column: "measurements_1year"
  add_foreign_key "fims", "fim_measurements", name: "fims_measurements_90day_fk", column: "measurements_90day"
  add_foreign_key "fims", "fim_measurements", name: "fims_measurements_finish_fk", column: "measurements_finish"
  add_foreign_key "fims", "fim_measurements", name: "fims_measurements_goal_fk", column: "measurements_goal"
  add_foreign_key "fims", "fim_measurements", name: "fims_measurements_start_fk", column: "measurements_start"

  add_foreign_key "patients", "addresses", name: "patients_address_id_fk", dependent: :delete
  add_foreign_key "patients", "addresses", name: "patients_caregiver_address_id_fk", column: "caregiver_address_id", dependent: :delete
  add_foreign_key "patients", "domain_genders", name: "patients_gender_fk", column: "gender"
  add_foreign_key "patients", "domain_highest_level_of_educations", name: "patients_highest_level_of_education_fk", column: "highest_level_of_education"
  add_foreign_key "patients", "domain_occupations", name: "patients_current_occupation_fk", column: "current_occupation"
  add_foreign_key "patients", "domain_occupations", name: "patients_occupation_at_time_of_injury_fk", column: "occupation_at_time_of_injury"
  add_foreign_key "patients", "domain_principle_pcp_types", name: "patients_principle_pcp_va_nonva_fk", column: "principle_pcp_va_nonva"
  add_foreign_key "patients", "domain_residence_types", name: "patients_residence_type_fk", column: "residence_type"
  add_foreign_key "patients", "domain_sci_types", name: "patients_sci_type_fk", column: "sci_type"
  add_foreign_key "patients", "domain_scid_eligibilities", name: "patients_scid_eligibility_fk", column: "scid_eligibility"
  add_foreign_key "patients", "domain_scid_etiologies", name: "patients_scid_etiology_fk", column: "scid_etiology"
  add_foreign_key "patients", "domain_theater_of_services", name: "patients_theater_of_service_fk", column: "theater_of_service"
  add_foreign_key "patients", "domain_travel_statuses", name: "patients_travel_status_fk", column: "travel_status"
  add_foreign_key "patients", "domain_va_medical_centers", name: "patients_assigned_vamc_fk", column: "assigned_vamc"
  add_foreign_key "patients", "domain_va_statuses", name: "patients_va_status_fk", column: "va_status"

end
