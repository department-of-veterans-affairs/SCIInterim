class AddCaregiverName < ActiveRecord::Migration
  def change
    add_column :patients, :caregiver_first_name, :string
    add_column :patients, :caregiver_last_name, :string  
  end
end