class FimId < ActiveRecord::Migration
  def change
    remove_column :annual_evaluations, :fim, :string
    add_column :annual_evaluations, :fim_id, :integer
    add_foreign_key :annual_evaluations, :fims, column: :fim_id, dependent: :delete

    reversible do |dir|
      dir.up do
        remove_foreign_key :fims, column: :measurements_start
        remove_foreign_key :fims, column: :measurements_goal
        remove_foreign_key :fims, column: :measurements_finish
        remove_foreign_key :fims, column: :measurements_90day
        remove_foreign_key :fims, column: :measurements_1year

        remove_column :fims, :measurements_start
        remove_column :fims, :measurements_goal
        remove_column :fims, :measurements_finish
        remove_column :fims, :measurements_90day
        remove_column :fims, :measurements_1year

        add_column :fims, :measurements_start_id, :integer
        add_column :fims, :measurements_goal_id, :integer
        add_column :fims, :measurements_finish_id, :integer
        add_column :fims, :measurements_90day_id, :integer
        add_column :fims, :measurements_1year_id, :integer

        add_foreign_key :fims, :fim_measurements, column: :measurements_start_id
        add_foreign_key :fims, :fim_measurements, column: :measurements_goal_id
        add_foreign_key :fims, :fim_measurements, column: :measurements_finish_id
        add_foreign_key :fims, :fim_measurements, column: :measurements_90day_id
        add_foreign_key :fims, :fim_measurements, column: :measurements_1year_id

        AnnualEvaluation.all.each do |annual_evaluation|
          annual_evaluation.build_fim
          annual_evaluation.fim.build_measurements_start
          annual_evaluation.save!
        end
      end
      dir.down do
        AnnualEvaluation.all.each do |annual_evaluation|
          annual_evaluation.fim = nil
          annual_evaluation.fim.measurements_start = nil
          annual_evaluation.save!
        end
        remove_foreign_key :fims, column: :measurements_start_id
        remove_foreign_key :fims, column: :measurements_goal_id
        remove_foreign_key :fims, column: :measurements_finish_id
        remove_foreign_key :fims, column: :measurements_90day_id
        remove_foreign_key :fims, column: :measurements_1year_id

        remove_column :fims, :measurements_start_id, :integer
        remove_column :fims, :measurements_goal_id, :integer
        remove_column :fims, :measurements_finish_id, :integer
        remove_column :fims, :measurements_90day_id, :integer
        remove_column :fims, :measurements_1year_id, :integer

        add_column :fims, :measurements_start, :integer
        add_column :fims, :measurements_goal, :integer
        add_column :fims, :measurements_finish, :integer
        add_column :fims, :measurements_90day, :integer
        add_column :fims, :measurements_1year, :integer

        add_foreign_key :fims, :fim_measurements, column: :measurements_start
        add_foreign_key :fims, :fim_measurements, column: :measurements_goal
        add_foreign_key :fims, :fim_measurements, column: :measurements_finish
        add_foreign_key :fims, :fim_measurements, column: :measurements_90day
        add_foreign_key :fims, :fim_measurements, column: :measurements_1year
      end
    end
  end
end
