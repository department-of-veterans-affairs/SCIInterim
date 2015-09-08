class OmrUpToDate < ActiveRecord::Migration
  def change
    # Remove unusd columns.
    remove_column :omrs, :start_fam, :string
    remove_column :omrs, :dusoi, :string
    remove_column :omrs, :goal_fam, :string
    remove_column :omrs, :finish_fam, :string
    remove_column :omrs, :finish_uspeq, :string

    # Fixup Dates
    rename_column :omrs, :omb_completed, :finish_date
    rename_column :omrs, :admission_date, :start_date
    add_column :omrs, :followup_90day_date, :date
    add_column :omrs, :followup_1yr_date, :date

    # Fix up asia columns.
    remove_column :omrs, :start_asia, :integer
    add_reference :omrs, :start_asia, references: :asia
    add_foreign_key :omrs, :asia, column: :start_asia_id

    remove_column :omrs, :finish_asia, :integer
    add_reference :omrs, :finish_asia, references: :asia
    add_foreign_key :omrs, :asia, column: :finish_asia_id

    # Fix up Fim columns.
    remove_column :omrs, :start_fim, :integer
    add_reference :omrs, :start_fim, references: :fims
    add_foreign_key :omrs, :fims, column: :start_fim_id

    remove_column :omrs, :goal_fim, :integer
    add_reference :omrs, :goal_fim, references: :fims
    add_foreign_key :omrs, :fims, column: :goal_fim_id

    remove_column :omrs, :finish_fim, :integer
    add_reference :omrs, :finish_fim, references: :fims
    add_foreign_key :omrs, :fims, column: :finish_fim_id

    add_reference :omrs, :followup_90day_fim, references: :fims
    add_foreign_key :omrs, :fims, column: :followup_90day_fim_id

    add_reference :omrs, :followup_1yr_fim, references: :fims
    add_foreign_key :omrs, :fims, column: :followup_1yr_fim_id

    # Fix up Chart-SF columns.
    add_reference :omrs, :followup_1yr_chart_sf, references: :chart_sfs
    add_foreign_key :omrs, :chart_sfs, column: :followup_1yr_chart_sf_id

    add_reference :omrs, :followup_90day_chart_sf, references: :chart_sfs
    add_foreign_key :omrs, :chart_sfs, column: :followup_90day_chart_sf_id

    # Fix up SF8 columns.
    add_reference :omrs, :followup_90day_sf8, references: :sf8s
    add_foreign_key :omrs, :sf8s, column: :followup_90day_sf8_id

    add_reference :omrs, :followup_1yr_sf8, references: :sf8s
    add_foreign_key :omrs, :sf8s, column: :followup_1yr_sf8_id
  end
end
