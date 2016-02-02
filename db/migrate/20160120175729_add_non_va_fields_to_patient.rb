class AddNonVaFieldsToPatient < ActiveRecord::Migration
  def change
  	add_column :patients, :non_va_facility_pcp_phone_number, :string
  	add_column :patients, :non_va_facility_pcp_fax_number, :string
  	add_column :patients, :non_va_facility_pcp_email, :string
  	add_column :patients, :non_va_facility_pcp_city, :string
  	add_column :patients, :non_va_facility_pcp_state, :string
  end
end
