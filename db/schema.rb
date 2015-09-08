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

ActiveRecord::Schema.define(version: 20150903201623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acute_rehabs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_fim",                  limit: 255
    t.string   "start_swls",                 limit: 255
    t.string   "goal_fim",                   limit: 255
    t.string   "finish_fim",                 limit: 255
    t.string   "reason_for_admission_other", limit: 255
    t.date     "hospital_admission"
    t.date     "acute_rehab_admission"
    t.date     "hospital_discharge"
    t.date     "acute_rehab_discharge"
    t.boolean  "discharge_to_community"
    t.string   "finish_swls",                limit: 255
    t.date     "followup_90day_date"
    t.string   "followup_90day_fim",         limit: 255
    t.string   "followup_90day_swls",        limit: 255
    t.date     "followup_1yr_date"
    t.string   "followup_1yr_fim",           limit: 255
    t.string   "followup_1yr_swls",          limit: 255
    t.integer  "patient_id"
    t.integer  "start_sf8_id"
    t.integer  "finish_sf8_id"
    t.integer  "followup_90day_sf8_id"
    t.integer  "followup_1year_sf8_id"
    t.integer  "followup_1year_chart_sf_id"
    t.integer  "followup_90day_chart_sf_id"
    t.integer  "reason_for_admission_id"
    t.integer  "discharge_location_id"
  end

  add_index "acute_rehabs", ["patient_id"], name: "index_acute_rehabs_on_patient_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "address1",     limit: 255
    t.string   "address2",     limit: 255
    t.string   "city",         limit: 255
    t.integer  "zip"
    t.string   "country",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "phone_number", limit: 255
    t.string   "state",        limit: 255
  end

  create_table "annual_evaluations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "eval_offered"
    t.date     "eval_completed"
    t.boolean  "is_inpatient"
    t.integer  "bmi"
    t.string   "cyh",                        limit: 255
    t.integer  "fim_id"
    t.integer  "patient_id"
    t.integer  "kurtzke_edss_id"
    t.integer  "bladder_drainage_method_id"
  end

  add_index "annual_evaluations", ["patient_id"], name: "index_annual_evaluations_on_patient_id", using: :btree

  create_table "asia", force: :cascade do |t|
    t.integer  "classification"
    t.boolean  "is_complete"
    t.boolean  "has_motor_or_sensory_asymmetry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "has_asia_id"
    t.string   "has_asia_type",                       limit: 255
    t.integer  "neurological_sensory_level_left_id"
    t.integer  "neurological_sensory_level_right_id"
    t.integer  "neurological_motor_level_left_id"
    t.integer  "neurological_motor_level_right_id"
    t.integer  "preservation_sensory_level_left_id"
    t.integer  "preservation_sensory_level_right_id"
    t.integer  "preservation_motor_level_left_id"
    t.integer  "preservation_motor_level_right_id"
  end

  add_index "asia", ["has_asia_id"], name: "index_asia_on_has_asia_id", using: :btree

  create_table "chart_sfs", force: :cascade do |t|
    t.integer  "q1a_hours_paid"
    t.integer  "q1b_hours_unpaid"
    t.integer  "q4_hours_out_of_bed_per_day"
    t.integer  "q5_days_out_of_house_per_week"
    t.integer  "q7a_hours_paid_for_job_per_week"
    t.integer  "q7b_occupation"
    t.integer  "q8_hours_in_school_per_week"
    t.integer  "q9_hours_homemaking_per_week"
    t.integer  "q10_hours_in_home_maintenance_per_week"
    t.integer  "q11_hours_in_recreation_per_week"
    t.integer  "q12_num_people_cohabiting"
    t.integer  "q14_num_relatives_cohabiting"
    t.integer  "q15_num_associates_visited_per_month"
    t.integer  "q16_num_friends_visited_per_month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "q2_at_home_assisted_cognitive_id"
    t.integer  "q3_not_home_assisted_cognitive_id"
    t.integer  "q6_nights_not_home_per_year_id"
    t.integer  "q13_living_with_spouse_id"
    t.integer  "q17_num_initiated_stranger_conversations_per_month_id"
    t.integer  "q18_household_combined_income_id"
    t.integer  "q19_total_medical_expenses_last_year_id"
  end

  create_table "domain_asia_classifications", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_bladder_drainage_methods", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_caregiver_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_at_home_cognitives", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_away_nights", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_household_incomes", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_initiated_stranger_conversations", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_medical_expenses", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_not_home_cognitives", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_chart_sf_spouse_resident_options", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_admission_classes", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_communication_comprehension_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_communication_expression_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_impairment_categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_impairment_groups", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_locomotion_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_fim_measurements", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_genders", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_highest_level_of_educations", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_kurtzke_edss_scores", force: :cascade do |t|
    t.text "name"
  end

  create_table "domain_level_of_injuries", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_occupations", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_principle_pcp_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_reason_for_admissions", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_residence_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_sci_hubs", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.string  "station", limit: 255
    t.integer "visn"
    t.text    "city"
  end

  add_index "domain_sci_hubs", ["station"], name: "index_domain_sci_hubs_on_station", unique: true, using: :btree

  create_table "domain_sci_types", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_scid_eligibilities", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_scid_etiologies", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_theater_of_services", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_travel_statuses", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "domain_va_medical_centers", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.string  "station", limit: 255
    t.integer "visn"
  end

  add_index "domain_va_medical_centers", ["station"], name: "index_domain_va_medical_centers_on_station", unique: true, using: :btree

  create_table "domain_va_statuses", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "fim_measurements", force: :cascade do |t|
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

  create_table "fims", force: :cascade do |t|
    t.boolean  "is_active_duty"
    t.boolean  "is_program_interrupted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "measurements_start_id"
    t.integer  "measurements_goal_id"
    t.integer  "measurements_finish_id"
    t.integer  "measurements_90day_id"
    t.integer  "measurements_1year_id"
    t.integer  "impairment_category_id"
    t.integer  "impairment_group_id"
    t.integer  "admission_class_id"
    t.integer  "locomotion_type_id"
    t.integer  "communication_comprehension_type_id"
    t.integer  "communication_expression_type_id"
  end

  create_table "kurtzke_edsses", force: :cascade do |t|
    t.string   "care_type",      limit: 255
    t.string   "score_type",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scale_value_id"
  end

  create_table "omrs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.string   "start_swls",                 limit: 255
    t.date     "finish_date"
    t.string   "finish_swls",                limit: 255
    t.integer  "patient_id"
    t.integer  "start_sf8_id"
    t.integer  "finish_sf8_id"
    t.integer  "start_chart_sf_id"
    t.integer  "finish_chart_sf_id"
    t.integer  "discharge_location_id"
    t.date     "followup_90day_date"
    t.date     "followup_1yr_date"
    t.integer  "start_asia_id"
    t.integer  "finish_asia_id"
    t.integer  "start_fim_id"
    t.integer  "goal_fim_id"
    t.integer  "finish_fim_id"
    t.integer  "followup_90day_fim_id"
    t.integer  "followup_1yr_fim_id"
    t.integer  "followup_1yr_chart_sf_id"
    t.integer  "followup_90day_chart_sf_id"
    t.integer  "followup_90day_sf8_id"
    t.integer  "followup_1yr_sf8_id"
  end

  add_index "omrs", ["patient_id"], name: "index_omrs_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.integer  "scido_id"
    t.string   "first_name",                             limit: 255
    t.string   "ssn",                                    limit: 255
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name",                              limit: 255
    t.boolean  "my_healthevet_messaging"
    t.boolean  "sci_service_connected"
    t.date     "benefits_waiver_exemption_date"
    t.string   "assigned_sci_hub_physician_first_name",  limit: 255
    t.string   "assigned_sci_hub_physician_last_name",   limit: 255
    t.string   "preferred_sci_hub_physician_first_name", limit: 255
    t.string   "preferred_sci_hub_physician_last_name",  limit: 255
    t.string   "non_va_facility_name",                   limit: 255
    t.string   "non_va_facility_phone_number",           limit: 255
    t.string   "non_va_facility_fax_number",             limit: 255
    t.string   "non_va_facility_pcp_first_name",         limit: 255
    t.string   "non_va_facility_pcp_last_name",          limit: 255
    t.string   "va_facility_pcp_first_name",             limit: 255
    t.string   "va_facility_pcp_last_name",              limit: 255
    t.date     "sci_arrival_date"
    t.boolean  "is_on_active_duty"
    t.date     "date_of_injury"
    t.boolean  "is_receiving_non_va_care"
    t.integer  "non_va_care_hours_per_month"
    t.date     "last_fee_basis_evaluation_date"
    t.boolean  "is_receiving_hhha"
    t.integer  "address_id",                                         null: false
    t.integer  "caregiver_address_id",                               null: false
    t.string   "scid_eligibility_other",                 limit: 255
    t.string   "caregiver_first_name",                   limit: 255
    t.string   "caregiver_last_name",                    limit: 255
    t.integer  "va_status_id"
    t.integer  "assigned_vamc_id"
    t.integer  "current_occupation_id"
    t.integer  "gender_id"
    t.integer  "has_caregiver_id"
    t.integer  "highest_level_of_education_id"
    t.integer  "occupation_at_time_of_injury_id"
    t.integer  "principle_pcp_va_nonva_id"
    t.integer  "residence_type_id"
    t.integer  "sci_type_id"
    t.integer  "scid_eligibility_id"
    t.integer  "scid_etiology_id"
    t.integer  "theater_of_service_id"
    t.integer  "travel_status_id"
    t.integer  "va_facility_id"
    t.integer  "assigned_sci_hub_id"
    t.integer  "preferred_sci_hub_id"
  end

  add_index "patients", ["address_id"], name: "index_patients_on_address_id", unique: true, using: :btree
  add_index "patients", ["caregiver_address_id"], name: "index_patients_on_caregiver_address_id", unique: true, using: :btree

  create_table "sf8s", force: :cascade do |t|
    t.integer  "q1_overall_health",                                               limit: 2
    t.integer  "q2a_physical_activities_limited_by_physical",                     limit: 2
    t.integer  "q2b_physical_activities_limited_by_physical_mobility_restricted", limit: 2
    t.integer  "q3_occupational_difficulty_by_physical_health",                   limit: 2
    t.integer  "q4_bodily_pain",                                                  limit: 2
    t.integer  "q5_energy",                                                       limit: 2
    t.integer  "q6_social_activities_limited_by_physical_or_emotional",           limit: 2
    t.integer  "q7_emotional_problems",                                           limit: 2
    t.integer  "q8_activities_limited_by_personal_or_emotional_problems",         limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", force: :cascade do |t|
    t.date     "in"
    t.date     "out"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "acute_rehab_id"
    t.string   "location",       limit: 255
  end

  add_index "transfers", ["acute_rehab_id"], name: "index_transfers_on_acute_rehab_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "acute_rehabs", "domain_reason_for_admissions", column: "reason_for_admission_id", name: "acute_rehabs_reason_for_admission_id_fk"
  add_foreign_key "acute_rehabs", "domain_residence_types", column: "discharge_location_id", name: "acute_rehabs_discharge_location_id_fk"
  add_foreign_key "acute_rehabs", "patients", name: "acute_rehabs_patient_id_fk", on_delete: :cascade
  add_foreign_key "annual_evaluations", "domain_bladder_drainage_methods", column: "bladder_drainage_method_id", name: "annual_evaluations_bladder_drainage_method_id_fk"
  add_foreign_key "annual_evaluations", "fims", name: "annual_evaluations_fim_id_fk", on_delete: :cascade
  add_foreign_key "annual_evaluations", "kurtzke_edsses", name: "annual_evaluations_kurtzke_edss_id_fk"
  add_foreign_key "annual_evaluations", "patients", name: "annual_evaluations_patient_id_fk", on_delete: :cascade
  add_foreign_key "asia", "domain_asia_classifications", column: "classification", name: "asia_classification_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "neurological_motor_level_left_id", name: "asia_neurological_motor_level_left_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "neurological_motor_level_right_id", name: "asia_neurological_motor_level_right_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "neurological_sensory_level_left_id", name: "asia_neurological_sensory_level_left_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "neurological_sensory_level_right_id", name: "asia_neurological_sensory_level_right_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "preservation_motor_level_left_id", name: "asia_preservation_motor_level_left_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "preservation_motor_level_right_id", name: "asia_preservation_motor_level_right_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "preservation_sensory_level_left_id", name: "asia_preservation_sensory_level_left_id_fk"
  add_foreign_key "asia", "domain_level_of_injuries", column: "preservation_sensory_level_right_id", name: "asia_preservation_sensory_level_right_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_at_home_cognitives", column: "q2_at_home_assisted_cognitive_id", name: "chart_sfs_q2_at_home_assisted_cognitive_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_away_nights", column: "q6_nights_not_home_per_year_id", name: "chart_sfs_q6_nights_not_home_per_year_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_household_incomes", column: "q18_household_combined_income_id", name: "chart_sfs_q18_household_combined_income_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_initiated_stranger_conversations", column: "q17_num_initiated_stranger_conversations_per_month_id", name: "chart_sfs_q17_num_initiated_stranger_conversations_per_month_id"
  add_foreign_key "chart_sfs", "domain_chart_sf_medical_expenses", column: "q19_total_medical_expenses_last_year_id", name: "chart_sfs_q19_total_medical_expenses_last_year_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_not_home_cognitives", column: "q3_not_home_assisted_cognitive_id", name: "chart_sfs_q3_not_home_assisted_cognitive_id_fk"
  add_foreign_key "chart_sfs", "domain_chart_sf_spouse_resident_options", column: "q13_living_with_spouse_id", name: "chart_sfs_q13_living_with_spouse_id_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "bathing", name: "fim_measurements_bathing_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "bladder_management", name: "fim_measurements_bladder_management_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "bowel_management", name: "fim_measurements_bowel_management_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "communication_comprehension", name: "fim_measurements_communication_comprehension_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "communication_expression", name: "fim_measurements_communication_expression_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "dressing_lower", name: "fim_measurements_dressing_lower_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "dressing_upper", name: "fim_measurements_dressing_upper_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "eating", name: "fim_measurements_eating_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "grooming", name: "fim_measurements_grooming_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "locomotion_stairs", name: "fim_measurements_locomotion_stairs_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "locomotion_walk_wheelchar", name: "fim_measurements_locomotion_walk_wheelchar_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "social_cognition_memory", name: "fim_measurements_social_cognition_memory_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "social_cognition_problem_solving", name: "fim_measurements_social_cognition_problem_solving_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "social_cognition_social_interaction", name: "fim_measurements_social_cognition_social_interaction_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "toileting", name: "fim_measurements_toileting_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "transfer_bed_chair_wheelchair", name: "fim_measurements_transfer_bed_chair_wheelchair_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "transfer_toilet", name: "fim_measurements_transfer_toilet_fk"
  add_foreign_key "fim_measurements", "domain_fim_measurements", column: "transfer_tub_shower", name: "fim_measurements_transfer_tub_shower_fk"
  add_foreign_key "fims", "domain_fim_admission_classes", column: "admission_class_id", name: "fims_admission_class_id_fk"
  add_foreign_key "fims", "domain_fim_communication_comprehension_types", column: "communication_comprehension_type_id", name: "fims_communication_comprehension_type_id_fk"
  add_foreign_key "fims", "domain_fim_communication_expression_types", column: "communication_expression_type_id", name: "fims_communication_expression_type_id_fk"
  add_foreign_key "fims", "domain_fim_impairment_categories", column: "impairment_category_id", name: "fims_impairment_category_id_fk"
  add_foreign_key "fims", "domain_fim_impairment_groups", column: "impairment_group_id", name: "fims_impairment_group_id_fk"
  add_foreign_key "fims", "domain_fim_locomotion_types", column: "locomotion_type_id", name: "fims_locomotion_type_id_fk"
  add_foreign_key "fims", "fim_measurements", column: "measurements_1year_id", name: "fims_measurements_1year_id_fk"
  add_foreign_key "fims", "fim_measurements", column: "measurements_90day_id", name: "fims_measurements_90day_id_fk"
  add_foreign_key "fims", "fim_measurements", column: "measurements_finish_id", name: "fims_measurements_finish_id_fk"
  add_foreign_key "fims", "fim_measurements", column: "measurements_goal_id", name: "fims_measurements_goal_id_fk"
  add_foreign_key "fims", "fim_measurements", column: "measurements_start_id", name: "fims_measurements_start_id_fk"
  add_foreign_key "kurtzke_edsses", "domain_kurtzke_edss_scores", column: "scale_value_id", name: "kurtzke_edsses_scale_value_id_fk"
  add_foreign_key "omrs", "asia", column: "finish_asia_id"
  add_foreign_key "omrs", "asia", column: "start_asia_id"
  add_foreign_key "omrs", "chart_sfs", column: "followup_1yr_chart_sf_id"
  add_foreign_key "omrs", "chart_sfs", column: "followup_90day_chart_sf_id"
  add_foreign_key "omrs", "domain_residence_types", column: "discharge_location_id", name: "omrs_discharge_location_id_fk"
  add_foreign_key "omrs", "fims", column: "finish_fim_id"
  add_foreign_key "omrs", "fims", column: "followup_1yr_fim_id"
  add_foreign_key "omrs", "fims", column: "followup_90day_fim_id"
  add_foreign_key "omrs", "fims", column: "goal_fim_id"
  add_foreign_key "omrs", "fims", column: "start_fim_id"
  add_foreign_key "omrs", "patients", name: "omrs_patient_id_fk", on_delete: :cascade
  add_foreign_key "omrs", "sf8s", column: "followup_1yr_sf8_id"
  add_foreign_key "omrs", "sf8s", column: "followup_90day_sf8_id"
  add_foreign_key "patients", "addresses", column: "caregiver_address_id", name: "patients_caregiver_address_id_fk", on_delete: :cascade
  add_foreign_key "patients", "addresses", name: "patients_address_id_fk", on_delete: :cascade
  add_foreign_key "patients", "domain_caregiver_types", column: "has_caregiver_id", name: "patients_has_caregiver_id_fk"
  add_foreign_key "patients", "domain_genders", column: "gender_id", name: "patients_gender_id_fk"
  add_foreign_key "patients", "domain_highest_level_of_educations", column: "highest_level_of_education_id", name: "patients_highest_level_of_education_id_fk"
  add_foreign_key "patients", "domain_occupations", column: "current_occupation_id", name: "patients_current_occupation_id_fk"
  add_foreign_key "patients", "domain_occupations", column: "occupation_at_time_of_injury_id", name: "patients_occupation_at_time_of_injury_id_fk"
  add_foreign_key "patients", "domain_principle_pcp_types", column: "principle_pcp_va_nonva_id", name: "patients_principle_pcp_va_nonva_id_fk"
  add_foreign_key "patients", "domain_residence_types", column: "residence_type_id", name: "patients_residence_type_id_fk"
  add_foreign_key "patients", "domain_sci_hubs", column: "assigned_sci_hub_id", name: "patients_assigned_sci_hub_id_fk"
  add_foreign_key "patients", "domain_sci_hubs", column: "preferred_sci_hub_id", name: "patients_preferred_sci_hub_id_fk"
  add_foreign_key "patients", "domain_sci_types", column: "sci_type_id", name: "patients_sci_type_id_fk"
  add_foreign_key "patients", "domain_scid_eligibilities", column: "scid_eligibility_id", name: "patients_scid_eligibility_id_fk"
  add_foreign_key "patients", "domain_scid_etiologies", column: "scid_etiology_id", name: "patients_scid_etiology_id_fk"
  add_foreign_key "patients", "domain_theater_of_services", column: "theater_of_service_id", name: "patients_theater_of_service_id_fk"
  add_foreign_key "patients", "domain_travel_statuses", column: "travel_status_id", name: "patients_travel_status_id_fk"
  add_foreign_key "patients", "domain_va_medical_centers", column: "assigned_vamc_id", name: "patients_assigned_vamc_id_fk"
  add_foreign_key "patients", "domain_va_medical_centers", column: "va_facility_id", name: "patients_va_facility_id_fk"
  add_foreign_key "patients", "domain_va_statuses", column: "va_status_id", name: "patients_va_status_id_fk"
  add_foreign_key "transfers", "acute_rehabs", name: "transfers_acute_rehab_id_fk"
end
