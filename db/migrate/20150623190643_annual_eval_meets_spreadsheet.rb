class AnnualEvalMeetsSpreadsheet < ActiveRecord::Migration
  def change
    change_column :annual_evaluations, :bmi, 'integer USING CAST(bmi AS integer)'
    change_column :annual_evaluations, :bladder_drainage_method, 'integer USING CAST(bladder_drainage_method AS integer)'
    add_column :annual_evaluations, :has_motor_or_sensory_asymmetry, :boolean
    add_column :annual_evaluations, :neuro_zone_of_preservation1, :integer
    add_column :annual_evaluations, :neuro_zone_of_preservation2, :integer
    add_column :annual_evaluations, :neuro_zone_of_preservation3, :integer

    add_column :annual_evaluations, :level_of_injury, :integer
    add_column :annual_evaluations, :asia_score, :integer

    # Columns not used.
    remove_column :annual_evaluations, :asia_level
    remove_column :annual_evaluations, :next_eval
    remove_column :annual_evaluations, :audit
    remove_column :annual_evaluations, :cage
    remove_column :annual_evaluations, :ces_d
    remove_column :annual_evaluations, :chart_sf
    remove_column :annual_evaluations, :dast
    remove_column :annual_evaluations, :dusoi
    remove_column :annual_evaluations, :dusoi_a
    remove_column :annual_evaluations, :fam
    remove_column :annual_evaluations, :kurtzke_fss
    remove_column :annual_evaluations, :mnfm
    remove_column :annual_evaluations, :prime_md
    remove_column :annual_evaluations, :push
    remove_column :annual_evaluations, :sf_mpq
    remove_column :annual_evaluations, :sf_8
    remove_column :annual_evaluations, :swls
    remove_column :annual_evaluations, :pumt_kit
    remove_column :annual_evaluations, :colonoscopy_received
    remove_column :annual_evaluations, :sigmoidoscopy_received
    remove_column :annual_evaluations, :diabetic_retinal_screening_received
  end
end
