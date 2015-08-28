class DomainWithBelongsTo < ActiveRecord::Migration
  def change
    #####
    ## Acute Patients
    remove_column :patients, :va_status, :integer
    add_reference :patients, :va_status, references: :domain_va_statuses
    add_foreign_key :patients, :domain_va_statuses, column: :va_status_id

    remove_column :patients, :assigned_vamc, :integer
    add_reference :patients, :assigned_vamc, references: :domain_va_medical_centers
    add_foreign_key :patients, :domain_va_medical_centers, column: :assigned_vamc_id

    remove_column :patients, :current_occupation, :integer
    add_reference :patients, :current_occupation, references: :domain_occupations
    add_foreign_key :patients, :domain_occupations, column: :current_occupation_id

    remove_column :patients, :gender, :integer
    add_reference :patients, :gender, references: :domain_genders
    add_foreign_key :patients, :domain_genders, column: :gender_id

    remove_column :patients, :has_caregiver, :integer
    add_reference :patients, :has_caregiver, references: :domain_caregiver_types
    add_foreign_key :patients, :domain_caregiver_types, column: :has_caregiver_id

    remove_column :patients, :highest_level_of_education, :integer
    add_reference :patients, :highest_level_of_education, references: :domain_highest_level_of_educations
    add_foreign_key :patients, :domain_highest_level_of_educations, column: :highest_level_of_education_id

    remove_column :patients, :occupation_at_time_of_injury, :integer
    add_reference :patients, :occupation_at_time_of_injury, references: :domain_occupations
    add_foreign_key :patients, :domain_occupations, column: :occupation_at_time_of_injury_id

    remove_column :patients, :principle_pcp_va_nonva, :integer
    add_reference :patients, :principle_pcp_va_nonva, references: :domain_principle_pcp_types
    add_foreign_key :patients, :domain_principle_pcp_types, column: :principle_pcp_va_nonva_id

    remove_column :patients, :residence_type, :integer
    add_reference :patients, :residence_type, references: :domain_residence_types
    add_foreign_key :patients, :domain_residence_types, column: :residence_type_id

    remove_column :patients, :sci_type, :integer
    add_reference :patients, :sci_type, references: :domain_sci_types
    add_foreign_key :patients, :domain_sci_types, column: :sci_type_id

    remove_column :patients, :scid_eligibility, :integer
    add_reference :patients, :scid_eligibility, references: :domain_scid_eligibilities
    add_foreign_key :patients, :domain_scid_eligibilities, column: :scid_eligibility_id

    remove_column :patients, :scid_etiology, :integer
    add_reference :patients, :scid_etiology, references: :domain_scid_etiologies
    add_foreign_key :patients, :domain_scid_etiologies, column: :scid_etiology_id

    remove_column :patients, :theater_of_service, :integer
    add_reference :patients, :theater_of_service, references: :domain_theater_of_services
    add_foreign_key :patients, :domain_theater_of_services, column: :theater_of_service_id

    remove_column :patients, :travel_status, :integer
    add_reference :patients, :travel_status, references: :domain_travel_statuses
    add_foreign_key :patients, :domain_travel_statuses, column: :travel_status_id

    remove_column :patients, :va_facility, :integer
    add_reference :patients, :va_facility, references: :domain_va_medical_centers
    add_foreign_key :patients, :domain_va_medical_centers, column: :va_facility_id

    #####
    ## Annual Evaluations
    remove_column :annual_evaluations, :bladder_drainage_method, :integer
    add_reference :annual_evaluations, :bladder_drainage_method, references: :domain_bladder_drainage_methods
    add_foreign_key :annual_evaluations, :domain_bladder_drainage_methods, column: :bladder_drainage_method_id

    #####
    ## Acute OMRs
    remove_column :omrs, :discharge_location, :integer
    add_reference :omrs, :discharge_location, references: :domain_residence_types
    add_foreign_key :omrs, :domain_residence_types, column: :discharge_location_id

    #####
    ## Acute Rehabs
    remove_column :acute_rehabs, :reason_for_admission, :integer
    add_reference :acute_rehabs, :reason_for_admission, references: :domain_reason_for_admissions
    add_foreign_key :acute_rehabs, :domain_reason_for_admissions, column: :reason_for_admission_id

    remove_column :acute_rehabs, :discharge_location, :integer
    add_reference :acute_rehabs, :discharge_location, references: :domain_residence_types
    add_foreign_key :acute_rehabs, :domain_residence_types, column: :discharge_location_id

    #####
    ## Asia
    remove_column :asia, :neurological_sensory_level_left, :integer
    add_reference :asia, :neurological_sensory_level_left, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :neurological_sensory_level_left_id

    remove_column :asia, :neurological_sensory_level_right, :integer
    add_reference :asia, :neurological_sensory_level_right, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :neurological_sensory_level_right_id

    remove_column :asia, :neurological_motor_level_left, :integer
    add_reference :asia, :neurological_motor_level_left, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :neurological_motor_level_left_id

    remove_column :asia, :neurological_motor_level_right, :integer
    add_reference :asia, :neurological_motor_level_right, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :neurological_motor_level_right_id

    remove_column :asia, :preservation_sensory_left, :integer
    add_reference :asia, :preservation_sensory_level_left, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :preservation_sensory_level_left_id

    remove_column :asia, :preservation_sensory_right, :integer
    add_reference :asia, :preservation_sensory_level_right, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :preservation_sensory_level_right_id

    remove_column :asia, :preservation_motor_left, :integer
    add_reference :asia, :preservation_motor_level_left, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :preservation_motor_level_left_id

    remove_column :asia, :preservation_motor_right, :integer
    add_reference :asia, :preservation_motor_level_right, references: :domain_level_of_injuries
    add_foreign_key :asia, :domain_level_of_injuries, column: :preservation_motor_level_right_id

    #####
    ## Chart-SF
    remove_column :chart_sfs, :q2_at_home_assisted_cognitive, :integer
    add_reference :chart_sfs, :q2_at_home_assisted_cognitive, references: :domain_chart_sf_at_home_cognitives
    add_foreign_key :chart_sfs, :domain_chart_sf_at_home_cognitives, column: :q2_at_home_assisted_cognitive_id

    remove_column :chart_sfs, :q3_not_home_assisted_cognitive, :integer
    add_reference :chart_sfs, :q3_not_home_assisted_cognitive, references: :domain_chart_sf_not_home_cognitives
    add_foreign_key :chart_sfs, :domain_chart_sf_not_home_cognitives, column: :q3_not_home_assisted_cognitive_id

    remove_column :chart_sfs, :q6_nights_not_home_per_year, :integer
    add_reference :chart_sfs, :q6_nights_not_home_per_year, references: :domain_chart_sf_away_nights
    add_foreign_key :chart_sfs, :domain_chart_sf_away_nights, column: :q6_nights_not_home_per_year_id

    remove_column :chart_sfs, :q13_living_with_spouse, :integer
    add_reference :chart_sfs, :q13_living_with_spouse, references: :domain_chart_sf_spouse_resident_options
    add_foreign_key :chart_sfs, :domain_chart_sf_spouse_resident_options, column: :q13_living_with_spouse_id

    remove_column :chart_sfs, :q17_num_initiated_stranger_conversations_per_month, :integer
    add_reference :chart_sfs, :q17_num_initiated_stranger_conversations_per_month, references: :domain_chart_sf_initiated_stranger_conversations
    add_foreign_key :chart_sfs, :domain_chart_sf_initiated_stranger_conversations, column: :q17_num_initiated_stranger_conversations_per_month_id

    remove_column :chart_sfs, :q18_household_combined_income, :integer
    add_reference :chart_sfs, :q18_household_combined_income, references: :domain_chart_sf_household_incomes
    add_foreign_key :chart_sfs, :domain_chart_sf_household_incomes, column: :q18_household_combined_income_id

    remove_column :chart_sfs, :q19_total_medical_expenses_last_year, :integer
    add_reference :chart_sfs, :q19_total_medical_expenses_last_year, references: :domain_chart_sf_medical_expenses
    add_foreign_key :chart_sfs, :domain_chart_sf_medical_expenses, column: :q19_total_medical_expenses_last_year_id

    #####
    ## FIM
    remove_column :fims, :impairment_category, :integer
    add_reference :fims, :impairment_category, references: :domain_fim_impairment_categories
    add_foreign_key :fims, :domain_fim_impairment_categories, column: :impairment_category_id

    remove_column :fims, :impairment_group, :integer
    add_reference :fims, :impairment_group, references: :domain_fim_impairment_groups
    add_foreign_key :fims, :domain_fim_impairment_groups, column: :impairment_group_id

    remove_column :fims, :admission_class, :integer
    add_reference :fims, :admission_class, references: :domain_fim_admission_classes
    add_foreign_key :fims, :domain_fim_admission_classes, column: :admission_class_id

    remove_column :fims, :locomotion_type, :integer
    add_reference :fims, :locomotion_type, references: :domain_fim_locomotion_types
    add_foreign_key :fims, :domain_fim_locomotion_types, column: :locomotion_type_id

    remove_column :fims, :communication_comprehension_type, :integer
    add_reference :fims, :communication_comprehension_type, references: :domain_fim_communication_comprehension_types
    add_foreign_key :fims, :domain_fim_communication_comprehension_types, column: :communication_comprehension_type_id

    remove_column :fims, :communication_expression_type, :integer
    add_reference :fims, :communication_expression_type, references: :domain_fim_communication_expression_types
    add_foreign_key :fims, :domain_fim_communication_expression_types, column: :communication_expression_type_id

    #####
    ## Kurtzke Edss
    remove_column :kurtzke_edsses, :scale_value, :integer
    add_reference :kurtzke_edsses, :scale_value, references: :domain_kurtzke_edss_scores
    add_foreign_key :kurtzke_edsses, :domain_kurtzke_edss_scores, column: :scale_value_id
  end
end
