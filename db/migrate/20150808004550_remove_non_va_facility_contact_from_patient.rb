class RemoveNonVaFacilityContactFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :non_va_facility_contact, :string
  end
end
