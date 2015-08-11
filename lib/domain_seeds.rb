module DomainSeeds
  GENDER_MAP = { "" => 0, "Female" => 1, "Male" => 2, "Unknown" => 3 }
  HIGHEST_LEVEL_OF_EDUCATION_MAP = {
    "" => 0,
    "No Diploma" => 1,
    "High School" => 2,
    "Some College" => 3,
    "Graduate School" => 4
  }
  SCI_TYPE_MAP = {
    "" => 0,
    "Unknown" => 1,
    "High Tetraplegic" => 2,
    "Low Tetraplegic" => 3,
    "Paraplegic" => 4
  }
  TRAVEL_STATUS_MAP = {
    "" => 0,
    "Not Eligible" => 1,
    ">=30% more" => 2,
    "VA pension" => 3,
    "Benefit Travel Waiver" => 4
  }
  THEATER_OF_SERVICE_MAP = {
    "" => 0,
    "NONE" => 1,
    "OEF/OIF" => 2,
    "OND" => 3
  }
  VA_STATUS_MAP = {
    "" => 0,
    "Active" => 1,
    "Deactivate" => 2,
    "On-Hold" => 3,
    "Expired" => 4
  }
  RESIDENCE_TYPE_MAP = {
    "" => 0,
    "Own" => 1,
    "Rent" => 2,
    "Homeless" => 3,
    "Assisted living" => 4,
    "Nursing home" => 5,
    "Shelter" => 6,
    "Group Home" => 7,
    "Board and Care" => 8,
  }
  CAREGIVER_TYPE_MAP = {
    "" => 0,
    "No Caregiver" => 1,
    "Paid Family" => 2,
    "Unpaid Family" => 3,
    "Paid Non-family" => 4,
    "Unpaid Non-family" => 5,
  }
  OCCUPATION_MAP = {
    "" => 0,
    "Working (competitive labor market, includes military)" => 1,
    "Homemaker" => 2,
    "On-th-job training" => 3,
    "Sheltered workshop" => 4,
    "Student" => 5,
    "Unemployed (may or may not be looking for work)" => 6,
    "Other, unclassified (includes volunteer, disability or medical leave)" => 7,
    "Unknown" => 8
  }
  SCID_ETIOLOGY_MAP = {
    "" => 0,
    "Sports" => 1,
    "Assault" => 2,
    "Transport" => 3,
    "Fall" => 4,
    "Other traumatic cause" => 5,
    "Non-traumatic spinal cord dysfunction" => 6,
    "Unspecified or Unknown" => 7
  }
  SCID_ELIGIBILITY_MAP = {
    "" => 0,
    "SCI" => 1,
    "MS" => 2,
    "ALS" => 3,
    "other" => 4
  }
  # This is here as a placeholder until we have a real list
  VA_MEDICAL_CENTER_MAP = {
    "" => 0,
    "VAMC Name 1" => 1,
    "VAMC Name 2" => 2,
    "VAMC Name 3" => 3,
    "VAMC Name 4" => 4,
    "VAMC Name 5" => 5,
    "VAMC Name 6" => 6,
    "VAMC Name 7" => 7,
    "VAMC Name 8" => 8,
    "VAMC Name 9" => 9,
    "VAMC Name 10" => 10,
    "VAMC Name 11" => 11
  }
  PRINCIPLE_PCP_VA_NONVA_MAP = { "" => 0, "VA" => 1, "NonVA" => 2, "Other" => 3 }

  def self.seed_domain_genders
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_genders, GENDER_MAP))
  end

  def self.seed_domain_highest_level_of_educations
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_highest_level_of_educations,
                            HIGHEST_LEVEL_OF_EDUCATION_MAP))
  end

  def self.seed_domain_sci_types
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_sci_types, SCI_TYPE_MAP))
  end

  def self.seed_domain_travel_statuses
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_travel_statuses, TRAVEL_STATUS_MAP))
  end

  def self.seed_domain_theater_of_services
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_theater_of_services, THEATER_OF_SERVICE_MAP))
  end

  def self.seed_domain_va_statuses
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_va_statuses, VA_STATUS_MAP))
  end

  def self.seed_domain_residence_types
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_residence_types, RESIDENCE_TYPE_MAP))
  end

  def self.seed_domain_caregiver_types
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_caregiver_types, CAREGIVER_TYPE_MAP))
  end

  def self.seed_domain_occupations
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_occupations, OCCUPATION_MAP))
  end

  def self.seed_domain_scid_etiologies
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_scid_etiologies, SCID_ETIOLOGY_MAP))
  end

  def self.seed_domain_scid_eligibilities
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_scid_eligibilities, SCID_ELIGIBILITY_MAP))
  end

  def self.seed_domain_va_medical_centers
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_va_medical_centers, VA_MEDICAL_CENTER_MAP))
  end

  def self.seed_domain_principle_pcp_types
    ActiveRecord::Base.connection.execute(
      make_insert_statement(:domain_principle_pcp_types, PRINCIPLE_PCP_VA_NONVA_MAP))
  end

  def self.seed_all
    ActiveRecord::Base.transaction do
      seed_domain_genders
      seed_domain_highest_level_of_educations
      seed_domain_sci_types
      seed_domain_travel_statuses
      seed_domain_theater_of_services
      seed_domain_va_statuses
      seed_domain_residence_types
      seed_domain_caregiver_types
      seed_domain_occupations
      seed_domain_scid_etiologies
      seed_domain_scid_eligibilities
      seed_domain_va_medical_centers
      seed_domain_principle_pcp_types
    end
  end

 private
  def self.make_insert_statement(table_name, value_map)
    values = value_map.map do |name, id|
      "(#{ActiveRecord::Base.connection.quote(id)}, #{ActiveRecord::Base.connection.quote(name)})"
    end
    "INSERT INTO #{table_name}(id, name) values #{values.join(',')}"
  end
end
