class CaregiverName < ActiveRecord::Migration
  def change
    add_column :patients, :caregiver_first_name, :string
    add_column :patients, :caregiver_last_name, :string
    remove_column :patients, :has_caregiver, :boolean
    add_column :patients, :caregiver_type, :integer
  end
end
