class RemoveAsiaFieldsFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :level_of_injury, :integer
    remove_column :patients, :is_asia_complete, :boolean
    remove_column :patients, :asia_level, :integer
  end
end
