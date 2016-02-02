class AddGoalsToAcuteRehab < ActiveRecord::Migration
  def change
  	add_column :acute_rehabs, :notes, :text, default: ""
  	add_column :acute_rehabs, :goals, :text, default: ""
  	add_column :acute_rehabs, :goals_met, :boolean
  	add_column :acute_rehabs, :goals_missed_reasons, :text, default: ""
  end
end
