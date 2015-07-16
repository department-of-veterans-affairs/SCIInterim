class ActiveDuty < ActiveRecord::Migration
  def change
    rename_column :patients, :is_injured_on_active_duty, :active_duty
  end
end

