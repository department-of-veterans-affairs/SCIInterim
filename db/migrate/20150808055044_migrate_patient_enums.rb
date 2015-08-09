require 'domain_seeds'

class MigratePatientEnums < ActiveRecord::Migration
  include DomainSeeds::MigrationHelper

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
        enum_to_domain(:patients, :domain_genders, :gender, DomainSeeds::GENDER_MAP)
        enum_to_domain(:patients, :domain_highest_level_of_educations, :highest_level_of_education, DomainSeeds::HIGHEST_LEVEL_OF_EDUCATION_MAP)
        enum_to_domain(:patients, :domain_sci_types, :sci_type, DomainSeeds::SCI_TYPE_MAP)
        enum_to_domain(:patients, :domain_travel_statuses, :travel_status, DomainSeeds::TRAVEL_STATUS_MAP)
        enum_to_domain(:patients, :domain_theater_of_services, :theater_of_service, DomainSeeds::THEATER_OF_SERVICE_MAP)
        enum_to_domain(:patients, :domain_va_statuses, :va_status, DomainSeeds::VA_STATUS_MAP)
        enum_to_domain(:patients, :domain_residence_types, :residence_type, DomainSeeds::RESIDENCE_TYPE_MAP)
        enum_to_domain(:patients, :domain_caregiver_types, :has_caregiver, DomainSeeds::CAREGIVER_TYPE_MAP)
        enum_to_domain(:patients, :domain_occupations, :occupation_at_time_of_injury, DomainSeeds::OCCUPATION_MAP)
        enum_to_domain(:patients, :domain_occupations, :current_occupation, DomainSeeds::OCCUPATION_MAP, seed_entries: false)
        enum_to_domain(:patients, :domain_scid_etiologies, :scid_etiology, DomainSeeds::SCID_ETIOLOGY_MAP)
        enum_to_domain(:patients, :domain_scid_eligibilities, :scid_eligibility, DomainSeeds::SCID_ELIGIBILITY_MAP)
        enum_to_domain(:patients, :domain_va_medical_centers, :assigned_vamc, DomainSeeds::VA_MEDICAL_CENTER_MAP)
        enum_to_domain(:patients, :domain_principle_pcp_types, :principle_pcp_va_nonva, DomainSeeds::PRINCIPLE_PCP_VA_NONVA_MAP)
      end
      dir.down do
        domain_to_enum(:patients, :gender, DomainSeeds::GENDER_MAP)
        domain_to_enum(:patients, :highest_level_of_education, DomainSeeds::HIGHEST_LEVEL_OF_EDUCATION_MAP)
        domain_to_enum(:patients, :sci_type, DomainSeeds::SCI_TYPE_MAP)
        domain_to_enum(:patients, :travel_status, DomainSeeds::TRAVEL_STATUS_MAP)
        domain_to_enum(:patients, :theater_of_service, DomainSeeds::THEATER_OF_SERVICE_MAP)
        domain_to_enum(:patients, :va_status, DomainSeeds::VA_STATUS_MAP)
        domain_to_enum(:patients, :residence_type, DomainSeeds::RESIDENCE_TYPE_MAP)
        domain_to_enum(:patients, :has_caregiver, DomainSeeds::CAREGIVER_TYPE_MAP)
        domain_to_enum(:patients, :occupation_at_time_of_injury, DomainSeeds::OCCUPATION_MAP)
        domain_to_enum(:patients, :current_occupation, DomainSeeds::OCCUPATION_MAP)
        domain_to_enum(:patients, :scid_etiology, DomainSeeds::SCID_ETIOLOGY_MAP)
        domain_to_enum(:patients, :scid_eligibility, DomainSeeds::SCID_ELIGIBILITY_MAP)
        domain_to_enum(:patients, :assigned_vamc, DomainSeeds::VA_MEDICAL_CENTER_MAP)
        domain_to_enum(:patients, :principle_pcp_va_nonva, DomainSeeds::PRINCIPLE_PCP_VA_NONVA_MAP)
      end
    end
  end
end
