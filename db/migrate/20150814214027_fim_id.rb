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
        ActiveRecord::Base.transaction do
          annual_evaluations = ActiveRecord::Base.connection.execute(
            "SELECT id FROM annual_evaluations")
          annual_evaluations.values.each do |row|
            raise "Unexpected #{row.inspect}" if row.size != 1
            annual_evaluation_id = row.first
            insert_result = ActiveRecord::Base.connection.execute(
              "INSERT INTO fims (created_at, updated_at) VALUES (now(), now()) RETURNING id")
            raise "Unexpected #{insert_result.inspect}" if insert_result.values.size != 1 && insert_result.values.first.size != 1
            fim_id = insert_result.values[0][0]
            add_fim_query = <<-EOM
              UPDATE annual_evaluations
                SET fim_id = '#{fim_id}',
                    updated_at = now()
                WHERE id = '#{annual_evaluation_id.first}'
            EOM
            ActiveRecord::Base.connection.execute(add_fim_query)
          end
        end
      end
      dir.down do
        ActiveRecord::Base.transaction do
          annual_evaluations = ActiveRecord::Base.connection.execute(
            "SELECT id, fim_id FROM annual_evaluations")
          annual_evaluations.values.each do |row|
            raise "Unexpected #{row.inspect}" if row.size != 2
            annual_evaluation_id = row[0]
            fim_id = row[1]
            ActiveRecord::Base.connection.execute(
              "UPDATE annual_evaluations SET fim_id = NULL, updated_at = now() WHERE id = '#{annual_evaluation_id}'")
            ActiveRecord::Base.connection.execute(
              "DELETE FROM fims WHERE id = '#{fim_id}'")
          end
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
