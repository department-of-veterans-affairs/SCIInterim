class OnActiveDuty < ActiveRecord::Migration
  def change
    rename_column :patients, :is_injured_on_active_duty, :is_on_active_duty
  end
end
