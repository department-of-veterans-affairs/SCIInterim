# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'factory_girl'

for i in 1..50
  patient = FactoryGirl.create(:patient)

  acute_rehab = FactoryGirl.create(:acute_rehab)
  patient.episode_of_cares << acute_rehab

  annual_eval = FactoryGirl.create(:annual_evaluation)
  patient.episode_of_cares << annual_eval

  omr = FactoryGirl.create(:omr)
  patient.episode_of_cares << omr

  patient.save
end
