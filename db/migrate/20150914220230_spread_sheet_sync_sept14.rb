class SpreadSheetSyncSept14 < ActiveRecord::Migration
  def change
    add_reference :omrs, :start_hub, references: :domain_sci_hubs
    add_foreign_key :omrs, :domain_sci_hubs, column: :start_hub_id

    remove_column :omrs, :start_fim_id, :integer
    remove_column :omrs, :goal_fim_id, :integer
    remove_column :omrs, :finish_fim_id, :integer
    remove_column :omrs, :followup_90day_fim_id, :integer
    remove_column :omrs, :followup_1yr_fim_id, :integer

    add_reference :acute_rehabs, :start_hub, references: :domain_sci_hubs
    add_foreign_key :acute_rehabs, :domain_sci_hubs, column: :start_hub_id

    add_reference :annual_evaluations, :offered_hub, references: :domain_sci_hubs
    add_foreign_key :annual_evaluations, :domain_sci_hubs, column: :offered_hub_id
    add_reference :annual_evaluations, :completed_hub, references: :domain_sci_hubs
    add_foreign_key :annual_evaluations, :domain_sci_hubs, column: :completed_hub_id
  end
end
