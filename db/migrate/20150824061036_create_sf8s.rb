class CreateSf8s < ActiveRecord::Migration
  def change
    create_table :sf8s do |t|
      t.integer :q1_overall_health, limit: 1
      t.integer :q2a_physical_activities_limited_by_physical, limit: 1
      t.integer :q2b_physical_activities_limited_by_physical_mobility_restricted, limit: 1
      t.integer :q3_occupational_difficulty_by_physical_health, limit: 1
      t.integer :q4_bodily_pain, limit: 1
      t.integer :q5_energy, limit: 1
      t.integer :q6_social_activities_limited_by_physical_or_emotional, limit: 1
      t.integer :q7_emotional_problems, limit: 1
      t.integer :q8_activities_limited_by_personal_or_emotional_problems, limit: 1

      t.timestamps
    end

    remove_column :acute_rehabs, :start_sf8, :string
    remove_column :acute_rehabs, :finish_sf8, :string
    remove_column :acute_rehabs, :followup_90day_sf8, :string
    remove_column :acute_rehabs, :followup_1yr_sf8, :string
    add_reference :acute_rehabs, :start_sf8, references: :sf8s
    add_reference :acute_rehabs, :finish_sf8, references: :sf8s
    add_reference :acute_rehabs, :followup_90day_sf8, references: :sf8s
    add_reference :acute_rehabs, :followup_1year_sf8, references: :sf8s

    remove_column :omrs, :start_sf_8, :string
    remove_column :omrs, :finish_sf_8, :string
    add_reference :omrs, :start_sf8, references: :sf8s
    add_reference :omrs, :finish_sf8, references: :sf8s
  end
end
