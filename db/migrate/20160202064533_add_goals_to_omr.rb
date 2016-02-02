class AddGoalsToOmr < ActiveRecord::Migration
  def change
 		add_column :omrs, :start_notes, :text, default: ""
 		add_column :omrs, :finish_notes, :text, default: ""
  	add_column :omrs, :goals, :text, default: ""
  	add_column :omrs, :goals_met, :boolean
  	add_column :omrs, :goals_missed_reasons, :text, default: ""
  end
end
