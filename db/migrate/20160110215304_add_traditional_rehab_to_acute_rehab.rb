class AddTraditionalRehabToAcuteRehab < ActiveRecord::Migration
  def change
  	add_column :acute_rehabs, :traditional_rehab, :boolean, default: true
  end
end
