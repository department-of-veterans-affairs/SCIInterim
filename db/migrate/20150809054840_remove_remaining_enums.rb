require 'domain_seeds'

class RemoveRemainingEnums < ActiveRecord::Migration
  include DomainSeeds::MigrationHelper

  def change
    create_table :domain_bladder_drainage_methods do |t|
      t.string 'name'
    end
    create_table :domain_reason_for_admissions do |t|
      t.string 'name'
    end
    create_table :domain_asia_classifications do |t|
      t.string 'name'
    end
    create_table :domain_level_of_injuries do |t|
      t.string 'name'
    end

    reversible do |dir|
      dir.up do
        enum_to_domain(:asia, :domain_asia_classifications, :classification)
        enum_to_domain(:asia, :domain_level_of_injuries, :neurological_sensory_level_left)
        enum_to_domain(:asia, :domain_level_of_injuries, :neurological_sensory_level_right, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :neurological_motor_level_left, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :neurological_motor_level_right, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :preservation_sensory_left, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :preservation_sensory_right, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :preservation_motor_left, seed_entries: false)
        enum_to_domain(:asia, :domain_level_of_injuries, :preservation_motor_right, seed_entries: false)

        enum_to_domain(:acute_rehabs, :domain_reason_for_admissions, :reason_for_admission)
        enum_to_domain(:acute_rehabs, :domain_residence_types, :residence_type, seed_entries: false)
        enum_to_domain(:annual_evaluations, :domain_bladder_drainage_methods, :bladder_drainage_method)
      end
      dir.down do
        domain_to_enum(:annual_evaluations, :bladder_drainage_method)
        domain_to_enum(:acute_rehabs, :reason_for_admission)
        domain_to_enum(:acute_rehabs, :residence_type)
        domain_to_enum(:asia, :classification)
        domain_to_enum(:asia, :neurological_sensory_level_left)
        domain_to_enum(:asia, :neurological_sensory_level_right)
        domain_to_enum(:asia, :neurological_motor_level_left)
        domain_to_enum(:asia, :neurological_motor_level_right)
        domain_to_enum(:asia, :preservation_sensory_left)
        domain_to_enum(:asia, :preservation_sensory_right)
        domain_to_enum(:asia, :preservation_motor_left)
        domain_to_enum(:asia, :preservation_motor_right)
      end
    end
  end
end
