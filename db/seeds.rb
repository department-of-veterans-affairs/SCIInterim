# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'json'

EpisodeOfCare.delete_all
Patient.delete_all

for i in 1...1000

  id = FactoryGirl.create(:patient).patient_id

  # Annual Evaluation
  FactoryGirl.create(:annual_evaluation, :patient_id => id)
  FactoryGirl.create(:annual_evaluation, :patient_id => id)
  FactoryGirl.create(:annual_evaluation, :patient_id => id)

  # Acute Rehab
  FactoryGirl.create(:acute_rehab, :patient_id => id)
  FactoryGirl.create(:acute_rehab90_day, :patient_id => id)
  FactoryGirl.create(:acute_rehab1_year, :patient_id => id)

  # OMR
  FactoryGirl.create(:omr, :patient_id => id)
  FactoryGirl.create(:omr90_day, :patient_id => id)
  FactoryGirl.create(:omr1_year, :patient_id => id)

  puts "Created patient ##{id}"
end