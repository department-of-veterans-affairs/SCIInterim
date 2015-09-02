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
        enum_to_domain(:patients, :domain_genders, :gender)
        enum_to_domain(:patients, :domain_highest_level_of_educations, :highest_level_of_education)
        enum_to_domain(:patients, :domain_sci_types, :sci_type)
        enum_to_domain(:patients, :domain_travel_statuses, :travel_status)
        enum_to_domain(:patients, :domain_theater_of_services, :theater_of_service)
        enum_to_domain(:patients, :domain_va_statuses, :va_status)
        enum_to_domain(:patients, :domain_residence_types, :residence_type)
        enum_to_domain(:patients, :domain_caregiver_types, :has_caregiver)
        enum_to_domain(:patients, :domain_occupations, :occupation_at_time_of_injury)
        enum_to_domain(:patients, :domain_occupations, :current_occupation, seed_entries: false)
        enum_to_domain(:patients, :domain_scid_etiologies, :scid_etiology)
        enum_to_domain(:patients, :domain_scid_eligibilities, :scid_eligibility)
        enum_to_domain(:patients, :domain_va_medical_centers, :assigned_vamc, seed_entries: false)
        enum_to_domain(:patients, :domain_principle_pcp_types, :principle_pcp_va_nonva)
      end
      dir.down do
        domain_to_enum(:patients, :gender)
        domain_to_enum(:patients, :highest_level_of_education)
        domain_to_enum(:patients, :sci_type)
        domain_to_enum(:patients, :travel_status)
        domain_to_enum(:patients, :theater_of_service)
        domain_to_enum(:patients, :va_status)
        domain_to_enum(:patients, :residence_type)
        domain_to_enum(:patients, :has_caregiver)
        domain_to_enum(:patients, :occupation_at_time_of_injury)
        domain_to_enum(:patients, :current_occupation)
        domain_to_enum(:patients, :scid_etiology)
        domain_to_enum(:patients, :scid_eligibility)
        domain_to_enum(:patients, :assigned_vamc)
        domain_to_enum(:patients, :principle_pcp_va_nonva)
      end
    end
  end
end
