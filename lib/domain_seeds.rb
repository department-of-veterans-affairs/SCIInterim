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
    0 => "",
    1 => "A",
    2 => "B",
    3 => "C",
    4 => "D",
  }
  BLADDER_DRAINAGE_METHOD_MAP = {
    0 => "",
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
    0 => "",
    1 => "No Caregiver",
    2 => "Paid Family",
    3 => "Unpaid Family",
    4 => "Paid Non-family",
    5 => "Unpaid Non-family",
  }
  FIM_ADMISSION_CLASS_MAP = {
    0 => "",
    1 => "Initial Rehabilitation",
    2 => "Short Stay Eval",
    3 => "Unplanned D/C",
    4 => "Readmission",
    5 => "Continuing Rehab",
  }
  FIM_IMPAIRMENT_CATEGORY_MAP = {
    0 => "",
    1 => "4.1 SCD - Non-Traumatic Spinal Cord Dysfunction",
    2 => "4.2 SCD - Traumatic Spinal Cord Dysfunction",
  }
  FIM_IMPAIRMENT_GROUP_MAP = {
    0 => "",
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
    0 => "",
    1 => "Walk",
    2 => "Wheelchair",
    3 => "Both"
  }
  FIM_COMMUNICATION_COMPREHENSION_TYPE_MAP = {
    0 => "",
    1 => "Auditory",
    2 => "Visual",
    3 => "Both",
  }
  FIM_COMMUNICATION_EXPRESSION_TYPE_MAP = {
    0 => "",
    1 => "Vocal",
    2 => "Non-vocal",
    3 => "Both",
  }
  FIM_MEASUREMENT_MAP = {
    0 => "",
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
    0 => "",
    1 => "Female",
    2 => "Male",
    3 => "Unknown",
  }
  HIGHEST_LEVEL_OF_EDUCATION_MAP = {
    0 => "",
    1 => "No Diploma",
    2 => "High School",
    3 => "Trade School",
    4 => "Some College",
    5 => "College",
    6 => "Graduate School",
  }
  LEVEL_OF_INJURIES_MAP = {
    0 => "",
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
    0 => "",
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
    0 => "",
    1 => "VA",
    2 => "NonVA",
    3 => "Other",
  }
  REASON_FOR_ADMISSION = {
    0 => "",
    1 => "Newly injured",
    2 => "Deconditioned",
    3 => "Transition to home",
    4 => "Other",
  }
  RESIDENCE_TYPE_MAP = {
    0 => "",
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
    0 => "",
    1 => "Unknown",
    2 => "High Tetraplegic",
    3 => "Low Tetraplegic",
    4 => "Paraplegic",
  }
  SCID_ELIGIBILITY_MAP = {
    0 => "",
    1 => "SCI",
    2 => "MS",
    3 => "ALS",
    4 => "Other",
  }
  SCID_ETIOLOGY_MAP = {
    0 => "",
    1 => "Sports",
    2 => "Assault",
    3 => "Transport",
    4 => "Fall",
    5 => "Other traumatic cause",
    6 => "Non-traumatic spinal cord dysfunction",
    7 => "Unspecified or Unknown",
  }
  THEATER_OF_SERVICE_MAP = {
    0 => "",
    1 => "NONE",
    2 => "OEF/OIF",
    3 => "OND",
  }
  TRAVEL_STATUS_MAP = {
    0 => "",
    1 => "Not Eligible",
    2 => ">=30% more",
    3 => "VA pension",
    4 => "Benefit Travel Waiver",
  }
  VA_MEDICAL_CENTER_MAP = {
    0 => "",
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
    0 => "",
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
      seed_domain_genders
      seed_domain_highest_level_of_educations
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
