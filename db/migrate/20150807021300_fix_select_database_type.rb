class FixSelectDatabaseType < ActiveRecord::Migration
  def change
    # Since this all has garbage data, just deleting and readding.
    remove_column :patients, :occupation_at_time_of_injury, :string
    add_column :patients, :occupation_at_time_of_injury, :integer
    remove_column :patients, :current_occupation, :string
    add_column :patients, :current_occupation, :integer
    remove_column :patients, :has_caregiver, :string
    add_column :patients, :has_caregiver, :integer
  end
end
