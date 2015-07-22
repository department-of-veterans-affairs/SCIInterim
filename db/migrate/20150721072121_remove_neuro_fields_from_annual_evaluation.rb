class RemoveNeuroFieldsFromAnnualEvaluation < ActiveRecord::Migration
  def change
    remove_column :annual_evaluations, :has_motor_or_sensory_asymmetry, :boolean
    remove_column :annual_evaluations, :neuro_zone_of_preservation1, :integer
    remove_column :annual_evaluations, :neuro_zone_of_preservation2, :integer
    remove_column :annual_evaluations, :neuro_zone_of_preservation3, :integer
    remove_column :annual_evaluations, :level_of_injury, :integer
    remove_column :annual_evaluations, :asia_score, :integer
  end
end
