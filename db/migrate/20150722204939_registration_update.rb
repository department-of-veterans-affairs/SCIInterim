class RegistrationUpdate < ActiveRecord::Migration
  def change
    remove_column :patients, :residence_name, :string
    remove_column :patients, :non_va_caregiver_receiving_reimbursement, :string
    remove_column :episode_of_cares, :episode_date, :string
    remove_column :addresses, :name, :string
    remove_column :addresses, :zip_plus4, :string
    add_column :addresses, :phone_number, :string
  end
end
