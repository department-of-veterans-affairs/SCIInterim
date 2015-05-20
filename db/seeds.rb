# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

ASIA = ["High-tetra", "Low-tetra", "parapalegia", "multiple scaroliosis"]

Patient.create!(patient_id:99999, name:'Albert J. Wong', ssn:'443-22-1234', dob:'02/04/1961')

require 'rubygems'
require 'faker'

Patient.delete_all
EpisodeOfCare.delete_all

for i in 1..10
  dob = Faker::Date.between(80.years.ago, 18.years.ago)
  dod = [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample
  patient = {

      patient_id: i,
      name: Faker::Name.name,
      ssn:  Faker::Number.number(3) + '-' + Faker::Number.number(2) + '-' + Faker::Number.number(3),
      dob:  dob,
      employment_status: [ :Employed, :Unemployed ].sample,
      highest_level_of_education: [ :"No Diploma", :"High School", :"Some College", :"Graduate School" ].sample,
      registration_status: [ :"Currently Served", :"Not Served" ].sample,
      date_of_death: [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample,
      sci_network: [true, false].sample,
      outcome_coordinator: Faker::Name.name,
  }
  patient_record = Patient.create!(patient)


  # AR
  start_fim = Faker::Number.between(18, 126)
  start_asia = ASIA.sample
  start_kurtzke_edss = Faker::Number.between(1, 100) / 1.0
  admission_date = Faker::Date.between(dob+18.years, dod != nil ? dod : Time.new)

  ar_data = {
      # "created_at"
      # "updated_at"
      actable_id: i,
      actable_type: 'acute_rehabs',
      episode_date: admission_date,
      patient_id: patient[:patient_id],
      admission_date: admission_date,
      start_asia: start_asia,
      start_fim: start_fim,
      start_swls: Faker::Number.between(5, 35),
      start_kurtzke_edss: start_kurtzke_edss,
      goal_fim: Faker::Number.between(start_fim, 126),
      accute_rehab_completed: [true, false].sample,
      finish_asia: [start_asia, ASIA.sample].sample,
      finish_fim: Faker::Number.between(start_fim, 126),
      finish_kurtzke_edss: Faker::Number.between(start_kurtzke_edss.floor, 100) / 1.0,
      finish_uspeq: Faker::Company.name, # Todo: Replace this with a valid choice
      discharge_location: ['Return to Community', 'VA Nursing Home', 'VA Hospital'].sample
  }

  AcuteRehab.create(ar_data)


  # OMR
  omr_start_fim = Faker::Number.between(18, 126)
  omr_start_asia = ASIA.sample
  start_kurtzke_edss = Faker::Number.between(1, 100) / 1.0
  omr_admission_date = Faker::Date.between(admission_date, dod != nil ? dod : Time.new)

  omr_data = {
      actable_id: (i*2)+2,
      actable_type: 'omrs',
      episode_date: omr_admission_date,
      patient_id: i,

      admission_date: omr_admission_date,
      start_asia: omr_start_asia,
      start_fim: omr_start_fim,
      start_fam: '23',
      start_swls: Faker::Number.between(5, 35),
      start_chart_sf: '23',
      start_sf_8: '23',
      dusoi: '2',
      goal_fim: '1',
      goal_fam: '1',
      omb_completed: Faker::Date.between(omr_admission_date, dod != nil ? dod : Time.new),
      finish_asia: ASIA.sample,
      finish_fim: Faker::Number.between(omr_start_fim, 126),
      finish_fam: '45',
      finish_swls: Faker::Number.between(5, 35),
      finish_chart_sf: '24',
      finish_sf_8: '44',
      finish_uspeq: '423',
      discharge_location: 'Home'
  }

  Omr.create!(omr_data)

end