require 'domain_seeds'

class MigratePatientEnums < ActiveRecord::Migration
  def enum_to_domain(model, table_name, domain_table_name, attribute_name, value_map, options = {})
    if !options.has_key?(:seed_entries) || options[:seed_entries]
      DomainSeeds.send("seed_#{domain_table_name}")
    end
    add_foreign_key table_name, domain_table_name, column: attribute_name
  end

  def domain_to_enum(model, table_name, attribute_name, value_map)
    remove_foreign_key table_name, column: attribute_name
    model.all.each { |obj| obj.send("#{attribute_name}=", value_map[obj.send(attribute_name)]); obj.save! }
  end

  def change
    create_table :domain_genders do |t|
      t.string 'name'
    end
    create_table :domain_highest_level_of_educations do |t|
      t.string 'name'
    end
    create_table :domain_sci_types do |t|
      t.string 'name'
    end
    create_table :domain_travel_statuses do |t|
      t.string 'name'
    end
    create_table :domain_theater_of_services do |t|
      t.string 'name'
    end
    create_table :domain_va_statuses do |t|
      t.string 'name'
    end
    create_table :domain_residence_types do |t|
      t.string 'name'
    end
    create_table :domain_caregiver_types do |t|
      t.string 'name'
    end
    create_table :domain_occupations do |t|
      t.string 'name'
    end
    create_table :domain_scid_etiologies do |t|
      t.string 'name'
    end
    create_table :domain_scid_eligibilities do |t|
      t.string 'name'
    end
    create_table :domain_va_medical_centers do |t|
      t.string 'name'
    end
    create_table :domain_principle_pcp_types do |t|
      t.string 'name'
    end

    reversible do |dir|
      dir.up do
        enum_to_domain(Patient, :patients, :domain_genders, :gender, DomainSeeds::GENDER_MAP)
        enum_to_domain(Patient, :patients, :domain_highest_level_of_educations, :highest_level_of_education, DomainSeeds::HIGHEST_LEVEL_OF_EDUCATION_MAP)
        enum_to_domain(Patient, :patients, :domain_sci_types, :sci_type, DomainSeeds::SCI_TYPE_MAP)
        enum_to_domain(Patient, :patients, :domain_travel_statuses, :travel_status, DomainSeeds::TRAVEL_STATUS_MAP)
        enum_to_domain(Patient, :patients, :domain_theater_of_services, :theater_of_service, DomainSeeds::THEATER_OF_SERVICE_MAP)
        enum_to_domain(Patient, :patients, :domain_va_statuses, :va_status, DomainSeeds::VA_STATUS_MAP)
        enum_to_domain(Patient, :patients, :domain_residence_types, :residence_type, DomainSeeds::RESIDENCE_TYPE_MAP)
        enum_to_domain(Patient, :patients, :domain_caregiver_types, :has_caregiver, DomainSeeds::CAREGIVER_TYPE_MAP)
        enum_to_domain(Patient, :patients, :domain_occupations, :occupation_at_time_of_injury, DomainSeeds::OCCUPATION_MAP)
        enum_to_domain(Patient, :patients, :domain_occupations, :current_occupation, DomainSeeds::OCCUPATION_MAP, seed_entries: false)
        enum_to_domain(Patient, :patients, :domain_scid_etiologies, :scid_etiology, DomainSeeds::SCID_ETIOLOGY_MAP)
        enum_to_domain(Patient, :patients, :domain_scid_eligibilities, :scid_eligibility, DomainSeeds::SCID_ELIGIBILITY_MAP)
        enum_to_domain(Patient, :patients, :domain_va_medical_centers, :assigned_vamc, DomainSeeds::VA_MEDICAL_CENTER_MAP)
        enum_to_domain(Patient, :patients, :domain_principle_pcp_types, :principle_pcp_va_nonva, DomainSeeds::PRINCIPLE_PCP_VA_NONVA_MAP)
      end
      dir.down do
        domain_to_enum(Patient, :patients, :gender, DomainSeeds::GENDER_MAP)
        domain_to_enum(Patient, :patients, :highest_level_of_education, DomainSeeds::HIGHEST_LEVEL_OF_EDUCATION_MAP)
        domain_to_enum(Patient, :patients, :sci_type, DomainSeeds::SCI_TYPE_MAP)
        domain_to_enum(Patient, :patients, :travel_status, DomainSeeds::TRAVEL_STATUS_MAP)
        domain_to_enum(Patient, :patients, :theater_of_service, DomainSeeds::THEATER_OF_SERVICE_MAP)
        domain_to_enum(Patient, :patients, :va_status, DomainSeeds::VA_STATUS_MAP)
        domain_to_enum(Patient, :patients, :residence_type, DomainSeeds::RESIDENCE_TYPE_MAP)
        domain_to_enum(Patient, :patients, :has_caregiver, DomainSeeds::CAREGIVER_TYPE_MAP)
        domain_to_enum(Patient, :patients, :occupation_at_time_of_injury, DomainSeeds::OCCUPATION_MAP)
        domain_to_enum(Patient, :patients, :current_occupation, DomainSeeds::OCCUPATION_MAP)
        domain_to_enum(Patient, :patients, :scid_etiology, DomainSeeds::SCID_ETIOLOGY_MAP)
        domain_to_enum(Patient, :patients, :scid_eligibility, DomainSeeds::SCID_ELIGIBILITY_MAP)
        domain_to_enum(Patient, :patients, :assigned_vamc, DomainSeeds::VA_MEDICAL_CENTER_MAP)
        domain_to_enum(Patient, :patients, :principle_pcp_va_nonva, DomainSeeds::PRINCIPLE_PCP_VA_NONVA_MAP)
      end
    end
  end
end
