class SmallFieldFixes < ActiveRecord::Migration
  def change
    # Fixes #148
    remove_column :patients, :va_facility, :string
    add_column :patients, :va_facility, :integer
    add_foreign_key :patients, :domain_va_medical_centers, column: :va_facility

    # Fixes #197
    remove_column :omrs, :discharge_location, :string
    add_column :omrs, :discharge_location, :integer
    add_foreign_key :omrs, :domain_residence_types, column: :discharge_location

    rename_column :acute_rehabs, :residence_type, :discharge_location
  end
end
