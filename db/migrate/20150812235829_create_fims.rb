require 'domain_seeds'

class CreateFims < ActiveRecord::Migration
  include DomainSeeds::MigrationHelper

  def change
    create_table :domain_fim_admission_classes do |t|
      t.string :name
    end

    create_table :domain_fim_impairment_categories do |t|
      t.string :name
    end

    create_table :domain_fim_impairment_groups do |t|
      t.string :name
    end

    create_table :domain_fim_locomotion_types do |t|
      t.string :name
    end

    create_table :domain_fim_communication_comprehension_types do |t|
      t.string :name
    end

    create_table :domain_fim_communication_expression_types do |t|
      t.string :name
    end

    create_table :domain_fim_measurements do |t|
      t.string :name
    end

    create_table :fim_measurements do |t|
      t.integer :eating
      t.integer :grooming
      t.integer :bathing
      t.integer :dressing_upper
      t.integer :dressing_lower
      t.integer :toileting
      t.integer :bladder_management
      t.integer :bowel_management
      t.integer :transfer_bed_chair_wheelchair
      t.integer :transfer_toilet
      t.integer :transfer_tub_shower
      t.integer :locomotion_walk_wheelchar
      t.integer :locomotion_stairs
      t.integer :communication_comprehension
      t.integer :communication_expression
      t.integer :social_cognition_social_interaction
      t.integer :social_cognition_problem_solving
      t.integer :social_cognition_memory

      t.timestamps
    end

    create_table :fims do |t|
      t.boolean :is_active_duty
      t.integer :admission_class
      t.boolean :is_program_interrupted
      t.integer :impairment_category
      t.integer :impairment_group
      t.integer :measurements_start
      t.integer :measurements_goal
      t.integer :measurements_finish
      t.integer :measurements_90day
      t.integer :measurements_1year
      t.integer :locomotion_type
      t.integer :communication_comprehension_type
      t.integer :communication_expression_type

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        enum_to_domain(:fims, :domain_fim_admission_classes, :admission_class)
        enum_to_domain(:fims, :domain_fim_impairment_categories, :impairment_category)
        enum_to_domain(:fims, :domain_fim_impairment_groups, :impairment_group)
        enum_to_domain(:fims, :domain_fim_locomotion_types, :locomotion_type)
        enum_to_domain(:fims, :domain_fim_communication_comprehension_types, :communication_comprehension_type)
        enum_to_domain(:fims, :domain_fim_communication_expression_types, :communication_expression_type)

        add_foreign_key :fims, :fim_measurements, column: :measurements_start
        add_foreign_key :fims, :fim_measurements, column: :measurements_goal
        add_foreign_key :fims, :fim_measurements, column: :measurements_finish
        add_foreign_key :fims, :fim_measurements, column: :measurements_90day
        add_foreign_key :fims, :fim_measurements, column: :measurements_1year

        enum_to_domain(:fim_measurements, :domain_fim_measurements, :eating)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :grooming, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :bathing, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :dressing_upper, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :dressing_lower, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :toileting, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :bladder_management, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :bowel_management, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :transfer_bed_chair_wheelchair, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :transfer_toilet, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :transfer_tub_shower, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :locomotion_walk_wheelchar, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :locomotion_stairs, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :communication_comprehension, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :communication_expression, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :social_cognition_social_interaction, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :social_cognition_problem_solving, seed_entries: false)
        enum_to_domain(:fim_measurements, :domain_fim_measurements, :social_cognition_memory, seed_entries: false)
      end
      dir.down do
        domain_to_enum(:fims, :admission_class)
        domain_to_enum(:fims, :impairment_category)
        domain_to_enum(:fims, :impairment_group)
        domain_to_enum(:fims, :locomotion_type)
        domain_to_enum(:fims, :communication_comprehension_type)
        domain_to_enum(:fims, :communication_expression_type)

        remove_foreign_key :fims, column: :measurements_start
        remove_foreign_key :fims, column: :measurements_goal
        remove_foreign_key :fims, column: :measurements_finish
        remove_foreign_key :fims, column: :measurements_90day
        remove_foreign_key :fims, column: :measurements_1year

        domain_to_enum(:fim_measurements, :eating)
        domain_to_enum(:fim_measurements, :grooming)
        domain_to_enum(:fim_measurements, :bathing)
        domain_to_enum(:fim_measurements, :dressing_upper)
        domain_to_enum(:fim_measurements, :dressing_lower)
        domain_to_enum(:fim_measurements, :toileting)
        domain_to_enum(:fim_measurements, :bladder_management)
        domain_to_enum(:fim_measurements, :bowel_management)
        domain_to_enum(:fim_measurements, :transfer_bed_chair_wheelchair)
        domain_to_enum(:fim_measurements, :transfer_toilet)
        domain_to_enum(:fim_measurements, :transfer_tub_shower)
        domain_to_enum(:fim_measurements, :locomotion_walk_wheelchar)
        domain_to_enum(:fim_measurements, :locomotion_stairs)
        domain_to_enum(:fim_measurements, :communication_comprehension)
        domain_to_enum(:fim_measurements, :communication_expression)
        domain_to_enum(:fim_measurements, :social_cognition_social_interaction)
        domain_to_enum(:fim_measurements, :social_cognition_problem_solving)
        domain_to_enum(:fim_measurements, :social_cognition_memory)
      end
    end
  end
end
