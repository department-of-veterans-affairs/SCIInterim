class AddRegistrationDateToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :registration_date, :date
  end
end
