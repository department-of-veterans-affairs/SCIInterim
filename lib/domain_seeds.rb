require 'set'

module DomainSeeds
  module MigrationHelper
    def enum_to_domain(table_name, domain_table_name, attribute_name, options = {})
      if !options.has_key?(:seed_entries) || options[:seed_entries]
        DomainSeeds.send("seed_#{domain_table_name}")
      end
      add_foreign_key table_name, domain_table_name, column: attribute_name
    end

    def domain_to_enum(table_name, attribute_name)
      remove_foreign_key table_name, column: attribute_name
    end
  end

  ASIA_CLASSIFICATION_MAP = {
    1 => "A",
    2 => "B",
    3 => "C",
    4 => "D",
  }
  BLADDER_DRAINAGE_METHOD_MAP = {
    1 => "BA - Bladder Augmentation",
    2 => "EC - Condom/External Catheter",
    3 => "IC - Intermittent Catheterization",
    4 => "IN - Indwelling Catheter",
    5 => "IP - Ileal Pouch",
    6 => "SC - Suprapubic Catheter",
    7 => "SS - Surgical Stent",
    8 => "VV - Voluntary Voiding",
  }
  CAREGIVER_TYPE_MAP = {
    1 => "No Caregiver",
    2 => "Paid Family",
    3 => "Unpaid Family",
    4 => "Paid Non-family",
    5 => "Unpaid Non-family",
  }
  CHART_SF_AT_HOME_COGNITIVE_MAP = {
    1 => "Someone else is always with me to observer or supervise",
    2 => "Someone else is always around, but they only check on me now and then",
    3 => "Sometimes I am left alone for an hour or two",
    4 => "Sometimes I am left alone for most of the day",
    5 => "I have been left alone all day and all night, but someone checks in on me",
    6 => "I am left alone without anyone checking on me",
  }
  CHART_SF_AWAY_NIGHT_MAP = {
    1 => "None",
    2 => "1-2",
    3 => "3-4",
    4 => "5 or more",
  }
  CHART_SF_HOUSEHOLD_INCOME_MAP = {
    1 => "Less than 10,000",
    2 => "10,000 - 14,999",
    3 => "15,000 - 19,999",
    4 => "20,000 - 24,999",
    5 => "25,000 - 34,999",
    6 => "35,000 - 49,999",
    7 => "50,000 - 74,999",
    8 => "75,000 or more",
    9 => "Don't know",
    10 => "Refused",
  }
  CHART_SF_INITIATED_STRANGER_CONVERSATION_MAP = {
    1 => "None",
    2 => "1-2",
    3 => "3-5",
    4 => "6 or more",
  }
  CHART_SF_MEDICAL_EXPENSE_MAP = {
    1 => "Less than 1,000",
    2 => "1,000 - 2,499",
    3 => "2,500 - 4,999",
    4 => "5,000 - 9,999",
    5 => "10,000 or more",
    9 => "Don't know",
    10 => "Refused",
  }
  CHART_SF_NOT_HOME_COGNITIVE_MAP = {
    1 => "I am restricted from leaving, even with someone else",
    2 => "Someone is always with me to help with remembering, decision-making or judgement when I go anywhere",
    3 => "I go to place on my own as long as they are familiar",
    4 => "I do not need help going anywhere",
  }
  CHART_SF_SPOUSE_RESIDENT_OPTION_MAP = {
    1 => "Yes",
    2 => "No",
    3 => "Not applicable (subject lives alone)",
  }
  FIM_ADMISSION_CLASS_MAP = {
    1 => "Initial Rehabilitation",
    2 => "Short Stay Eval",
    3 => "Unplanned D/C",
    4 => "Readmission",
    5 => "Continuing Rehab",
  }
  FIM_IMPAIRMENT_CATEGORY_MAP = {
    1 => "4.1 SCD - Non-Traumatic Spinal Cord Dysfunction",
    2 => "4.2 SCD - Traumatic Spinal Cord Dysfunction",
  }
  FIM_IMPAIRMENT_GROUP_MAP = {
    1 => "4.11 Non-Traumatic Paraplegia, Unspecified",
    2 => "4.111 Non-Traumatic Incomplete Paraplegia",
    3 => "4.112 Non-Traumatic Complete Paraplegia",
    4 => "4.12 Non-Traumatic Quadriplegia Unspecified",
    5 => "4.1211 Non-Traumatic Quadriplegia Incomplete C1-4",
    6 => "4.1212 Non-Traumatic Quadriplegia Incomplete C5-8",
    7 => "4.1221 Non-Traumatic Quadriplegia Complete C1-4",
    8 => "4.1222 Non-Traumatic Quadriplegia Complete C5-8",
    9 => "4.13 Other Non-Traumatic SC",
    10 => "4.21 Traumatic Paraplegia, Unspecified",
    11 => "4.211 Traumatic Incomplete Paraplegia",
    12 => "4.212 Traumatic Complete Paraplegia",
    13 => "4.22 Traumatic Quadriplegia, Unspecified",
    14 => "4.2211 Traumatic Quadriplegia Incomplete C1-4",
    15 => "4.2212 Traumatic Quadriplegia Incomplete C5-8",
    16 => "4.2221 Traumatic Quadriplegia Complete C1-4",
    17 => "4.2222 Traumatic Quadriplegia Complete C5-8",
    18 => "4.23 Other Traumatic SC",
  }
  FIM_LOCOMOTION_TYPE_MAP = {
    1 => "Walk",
    2 => "Wheelchair",
    3 => "Both"
  }
  FIM_COMMUNICATION_COMPREHENSION_TYPE_MAP = {
    1 => "Auditory",
    2 => "Visual",
    3 => "Both",
  }
  FIM_COMMUNICATION_EXPRESSION_TYPE_MAP = {
    1 => "Vocal",
    2 => "Non-vocal",
    3 => "Both",
  }
  FIM_MEASUREMENT_MAP = {
    1 => "Total Assistance (performs less than 25% of task)",
    2 => "Maximal Assistance (performs 25%-49% of task)",
    3 => "Moderate Assistance (performs 50%-74% of task)",
    4 => "Minimal Contact Assistance (performs 75% or more of task)",
    5 => "Supervision of Setup (cuing, coaxing, prompting)",
    6 => "Modified Independence (extra time, devices)",
    7 => "Complete Independence (timely, safely)",
  }
  GENDER_MAP = {
    # TODO(awong): This is a very VERY limited set of genders. Currently
    # stuck this way because we need to reconcile with a legacy system.
    # Find a way to extend the list to encompass the full complexity of
    # gender identity.
    1 => "Female",
    2 => "Male",
    3 => "Unknown",
  }
  HIGHEST_LEVEL_OF_EDUCATION_MAP = {
    1 => "No Diploma",
    2 => "High School",
    3 => "Trade School",
    4 => "Some College",
    5 => "College",
    6 => "Graduate School",
  }
  KURTZKE_EDSS_SCORE_MAP = {
    1 => "0.0 - Normal neurologic examination (all grade 0 in Functional Systems [FS]; Cerebral grade 1 acceptable).",
    2 => "1.0 - No disability, minimal signs in one FS (i.e., grade 1 excluding Cerebral grade 1).",
    3 => "1.5 - No disability, minimal signs in more than one FS (more than one grade 1 excluding Cerebral grade 1).",
    4 => "2.0 - Minimal disability in one FS (one FS grade 2, others 0 or 1).",
    5 => "2.5 - Minimal disability in two FS (two FS grade 2, others 0 or 1).",
    6 => "3.0 - Moderate disability in one FS (one FS grade 3, others 0 or 1), or mild disability in three or four FS (three/four FS grade 2, others 0 or 1) though fully ambulatory.",
    7 => "3.5 - Fully ambulatory but with moderate disability in one FS (one grade 3) and one or two FS grade 2; or two FS grade 3; or five FS grade 2 (others 0 or 1).",
    8 => "4.0 - Fully ambulatory without aid, self-sufficient, up and about some 12 hours a day despite relatively severe disability consisting of one FS grade 4 (others 0 or 1) or combinations of lesser grades exceeding limits of previous steps. Able to walk without aid or rest some 500 meters.",
    9 => "4.5 - Fully ambulatory without aid, up and about much of the day, able to work a full day, may otherwise have some limitation of full activity or require minimal assistance; characterized by relatively severe disability, usually consisting of one FS grade 4 (others 0 or 1) or combinations of lesser grades exceeding limits of previous steps. Able to walk without aid or rest for some 300 meters.",
    10 => "5.0 - Ambulatory without aid or rest for about 200 meters; disability severe enough to impair full daily activities (e.g., to work full day without special provisions). (Usual FS equivalents are one grade 5 alone, others 0 or 1; or combinations of lesser grades usually exceeding specifications for step 4.0.)",
    11 => "5.5 - Ambulatory without aid or rest for about 100 meters; disability severe enough to preclude full daily activities. (Usual FS equivalents are one grade 5 alone, others 0 or 1; or combinations of lesser grades usually exceeding those for step 4.0).",
    12 => "6.0 - Intermittent or unilateral constant assistance (cane, crutch, or brace) required to walk about 100 meters with or without resting. (Usual FS equivalents are combinations with more than two FS grade 3+.)",
    13 => "6.5 - Constant bilateral assistance (canes, crutches, or braces) required to walk about 20 meters without resting. (Usual FS equivalents are combinations with more than two FS grade 3+.)",
    14 => "7.0 - Unable to walk beyond about 5 meters even with aid, essentially restricted to wheelchair; wheels self in standard wheelchair and transfers alone; up and about in some 12 hours a day. (Usual FS equivalents are combinations with more than one FS grade 4+; very rarely, pyramidal grade 5 alone.)",
    15 => "7.5 - Unable to take more than a few steps; restricted to wheelchair; may need aid in transfer; wheels self but cannot carry on in standard wheelchair a full day; may require motorized wheelchair. (Usual FS equivalents are combinations with more than one FS grade 4+.)",
    16 => "8.0 - Essentially restricted to bed or chair or perambulated in wheelchair, but may be out of bed itself much of the day; retains many self-care functions; generally has effective use of arms. (Usual FS equivalents are combinations, generally grade 4+ in several systems.)",
    17 => "8.5 - Essentially restricted to bed much of the day; has some effective use of arm(s); retains some self-care functions. (Usual FS equivalents are combinations, generally grade 4+ in several systems.)",
    18 => "9.0 - Helpless bed patient; can communicate and eat. (Usual FS equivalents are combinations, mostly grade 4+.)",
    19 => "9.5 - Totally helpless bed patient; unable to communicate effectively or eat/swallow. (Usual FS equivalents are combinations, almost all grade 4+.)",
    20 => "10 - Death due to MS.",
  }
  LEVEL_OF_INJURIES_MAP = {
    1 => "C1",
    2 => "C2",
    3 => "C3",
    4 => "C4",
    5 => "C5",
    6 => "C6",
    7 => "C7",
    8 => "C8",
    9 => "T1",
    10 => "T2",
    11 => "T3",
    12 => "T4",
    13 => "T5",
    14 => "T6",
    15 => "T7",
    16 => "T8",
    17 => "T9",
    18 => "T10",
    19 => "T11",
    20 => "T12",
    21 => "L1",
    22 => "L2",
    23 => "L3",
    24 => "L4",
    25 => "L5",
    26 => "S1",
    27 => "S2",
    28 => "S3",
    29 => "S4-5",
  }
  OCCUPATION_MAP = {
    1 => "Working (competitive labor market, includes military)",
    2 => "Homemaker",
    3 => "On-th-job training",
    4 => "Sheltered workshop",
    5 => "Student",
    6 => "Unemployed (may or may not be looking for work)",
    7 => "Other, unclassified (includes volunteer, disability or medical leave)",
    8 => "Unknown",
  }
  PRINCIPLE_PCP_VA_NONVA_MAP = {
    1 => "VA",
    2 => "NonVA",
    3 => "Other",
  }
  REASON_FOR_ADMISSION = {
    1 => "Newly injured",
    2 => "Deconditioned",
    3 => "Transition to home",
    4 => "Other",
  }
  RESIDENCE_TYPE_MAP = {
    1 => "01 Private residence",
    2 => "02 Hospital",
    3 => "03 Nursing home",
    4 => "04 Assisted living residence",
    5 => "05 Group living situation",
    6 => "06 Correctional institution",
    7 => "07 Hotel or motel",
    8 => "08 Homeless",
    9 => "09 Deceased",
   10 => "10 Other, unclassified",
   99 => "99 Unknown",
  }
  SCI_TYPE_MAP = {
    1 => "Unknown",
    2 => "High Tetraplegic",
    3 => "Low Tetraplegic",
    4 => "Paraplegic",
  }
  SCID_ELIGIBILITY_MAP = {
    1 => "SCI",
    2 => "MS",
    3 => "ALS",
    4 => "Other",
  }
  SCID_ETIOLOGY_MAP = {
    1 => "Sports",
    2 => "Assault",
    3 => "Transport",
    4 => "Fall",
    5 => "Other traumatic cause",
    6 => "Non-traumatic spinal cord dysfunction",
    7 => "Unspecified or Unknown",
  }
  THEATER_OF_SERVICE_MAP = {
    1 => "NONE",
    2 => "OEF/OIF",
    3 => "OND",
  }
  TRAVEL_STATUS_MAP = {
    1 => "Not Eligible",
    2 => ">=30% more",
    3 => "VA pension",
    4 => "Benefit Travel Waiver",
  }
  VA_MEDICAL_CENTER_MAP = {
    # This is here as a placeholder until we have a real list
    1 => "VAMC Name 1",
    2 => "VAMC Name 2",
    3 => "VAMC Name 3",
    4 => "VAMC Name 4",
    5 => "VAMC Name 5",
    6 => "VAMC Name 6",
    7 => "VAMC Name 7",
    8 => "VAMC Name 8",
    9 => "VAMC Name 9",
    10 => "VAMC Name 10",
    11 => "VAMC Name 11",
  }
  VA_STATUS_MAP = {
    1 => "Active",
    2 => "Deactivate",
    3 => "On-Hold",
    4 => "Expired",
  }

  def self.seed_domain_asia_classifications
    update_domain_table(:domain_asia_classifications,
                        ASIA_CLASSIFICATION_MAP)
  end

  def self.seed_domain_bladder_drainage_methods
    update_domain_table(:domain_bladder_drainage_methods,
                        BLADDER_DRAINAGE_METHOD_MAP)
  end

  def self.seed_domain_caregiver_types
    update_domain_table(:domain_caregiver_types, CAREGIVER_TYPE_MAP)
  end

  def self.seed_domain_chart_sf_at_home_cognitives
    update_domain_table(:domain_chart_sf_at_home_cognitives,
                        CHART_SF_AT_HOME_COGNITIVE_MAP)
  end

  def self.seed_domain_chart_sf_away_nights
    update_domain_table(:domain_chart_sf_away_nights, CHART_SF_AWAY_NIGHT_MAP)
  end

  def self.seed_domain_chart_sf_household_incomes
    update_domain_table(:domain_chart_sf_household_incomes,
                        CHART_SF_HOUSEHOLD_INCOME_MAP)
  end

  def self.seed_domain_chart_sf_initiated_stranger_conversations
    update_domain_table(:domain_chart_sf_initiated_stranger_conversations,
                        CHART_SF_INITIATED_STRANGER_CONVERSATION_MAP)
  end

  def self.seed_domain_chart_sf_medical_expenses
    update_domain_table(:domain_chart_sf_medical_expenses,
                        CHART_SF_MEDICAL_EXPENSE_MAP)
  end

  def self.seed_domain_chart_sf_not_home_cognitives
    update_domain_table(:domain_chart_sf_not_home_cognitives,
                        CHART_SF_NOT_HOME_COGNITIVE_MAP)
  end

  def self.seed_domain_chart_sf_spouse_resident_options
    update_domain_table(:domain_chart_sf_spouse_resident_options,
                        CHART_SF_SPOUSE_RESIDENT_OPTION_MAP)
  end

  def self.seed_domain_fim_admission_classes
    update_domain_table(:domain_fim_admission_classes,
                        FIM_ADMISSION_CLASS_MAP)
  end

  def self.seed_domain_fim_communication_comprehension_types
    update_domain_table(:domain_fim_communication_comprehension_types,
                        FIM_COMMUNICATION_COMPREHENSION_TYPE_MAP)
  end

  def self.seed_domain_fim_communication_expression_types
    update_domain_table(:domain_fim_communication_expression_types,
                        FIM_COMMUNICATION_EXPRESSION_TYPE_MAP)
  end

  def self.seed_domain_fim_impairment_categories
    update_domain_table(:domain_fim_impairment_categories,
                        FIM_IMPAIRMENT_CATEGORY_MAP)
  end

  def self.seed_domain_fim_impairment_groups
    update_domain_table(:domain_fim_impairment_groups,
                        FIM_IMPAIRMENT_GROUP_MAP)
  end

  def self.seed_domain_fim_locomotion_types
    update_domain_table(:domain_fim_locomotion_types, FIM_LOCOMOTION_TYPE_MAP)
  end

  def self.seed_domain_fim_measurements
    update_domain_table(:domain_fim_measurements, FIM_MEASUREMENT_MAP)
  end

  def self.seed_domain_genders
    update_domain_table(:domain_genders, GENDER_MAP)
  end

  def self.seed_domain_highest_level_of_educations
    update_domain_table(:domain_highest_level_of_educations,
                        HIGHEST_LEVEL_OF_EDUCATION_MAP)
  end

  def self.seed_domain_kurtzke_edss_scores
    update_domain_table(:domain_kurtzke_edss_scores,
                        KURTZKE_EDSS_SCORE_MAP)
  end

  def self.seed_domain_level_of_injuries
    update_domain_table(:domain_level_of_injuries, LEVEL_OF_INJURIES_MAP)
  end

  def self.seed_domain_occupations
    update_domain_table(:domain_occupations, OCCUPATION_MAP)
  end

  def self.seed_domain_principle_pcp_types
    update_domain_table(:domain_principle_pcp_types, PRINCIPLE_PCP_VA_NONVA_MAP)
  end

  def self.seed_domain_reason_for_admissions
    update_domain_table(:domain_reason_for_admissions, REASON_FOR_ADMISSION)
  end

  def self.seed_domain_residence_types
    update_domain_table(:domain_residence_types, RESIDENCE_TYPE_MAP)
  end

  def self.seed_domain_sci_types
    update_domain_table(:domain_sci_types, SCI_TYPE_MAP)
  end

  def self.seed_domain_scid_eligibilities
    update_domain_table(:domain_scid_eligibilities, SCID_ELIGIBILITY_MAP)
  end

  def self.seed_domain_scid_etiologies
    update_domain_table(:domain_scid_etiologies, SCID_ETIOLOGY_MAP)
  end

  def self.seed_domain_theater_of_services
    update_domain_table(:domain_theater_of_services, THEATER_OF_SERVICE_MAP)
  end

  def self.seed_domain_travel_statuses
    update_domain_table(:domain_travel_statuses, TRAVEL_STATUS_MAP)
  end

  def self.seed_domain_va_medical_centers
    update_domain_table(:domain_va_medical_centers, VA_MEDICAL_CENTER_MAP)
  end

  def self.seed_domain_va_statuses
    update_domain_table(:domain_va_statuses, VA_STATUS_MAP)
  end

  def self.seed_all
    ActiveRecord::Base.transaction do
      seed_domain_asia_classifications
      seed_domain_bladder_drainage_methods
      seed_domain_caregiver_types
      seed_domain_chart_sf_at_home_cognitives
      seed_domain_chart_sf_away_nights
      seed_domain_chart_sf_household_incomes
      seed_domain_chart_sf_initiated_stranger_conversations
      seed_domain_chart_sf_medical_expenses
      seed_domain_chart_sf_not_home_cognitives
      seed_domain_chart_sf_spouse_resident_options
      seed_domain_fim_admission_classes
      seed_domain_fim_communication_comprehension_types
      seed_domain_fim_communication_expression_types
      seed_domain_fim_impairment_categories
      seed_domain_fim_impairment_groups
      seed_domain_fim_locomotion_types
      seed_domain_fim_measurements
      seed_domain_genders
      seed_domain_highest_level_of_educations
      seed_domain_kurtzke_edss_scores
      seed_domain_level_of_injuries
      seed_domain_occupations
      seed_domain_principle_pcp_types
      seed_domain_reason_for_admissions
      seed_domain_residence_types
      seed_domain_sci_types
      seed_domain_scid_eligibilities
      seed_domain_scid_etiologies
      seed_domain_theater_of_services
      seed_domain_travel_statuses
      seed_domain_va_medical_centers
      seed_domain_va_statuses
    end
  end

 private
  def self.update_domain_table(table_name, value_map)
    ActiveRecord::Base.transaction do
      result = ActiveRecord::Base.connection.execute("SELECT id from #{table_name}")
      # PG:Results come back as an array of arrays even if it's a single value per row.
      existing_ids = result.values.inject(Set.new) { |memo, id| memo << id.first.to_i }
      key_set = Set.new(value_map.keys)

      (key_set & existing_ids).each do |id|
        ActiveRecord::Base.connection.execute(
          "UPDATE #{table_name} SET name = #{ActiveRecord::Base.connection.quote(value_map[id])} WHERE id = #{ActiveRecord::Base.connection.quote(id)}")
      end

      (key_set - existing_ids).each do |id|
        ActiveRecord::Base.connection.execute(
          "INSERT INTO #{table_name} (name, id) values (#{ActiveRecord::Base.connection.quote(value_map[id])}, #{ActiveRecord::Base.connection.quote(id)})")
      end

      to_delete = (existing_ids - key_set).map { |id| ActiveRecord::Base.connection.quote(id) }
      ActiveRecord::Base.connection.execute("DELETE FROM #{table_name} where id in (#{to_delete.join(',')})") if !to_delete.empty?
    end
  end
end
