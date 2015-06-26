# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

ASIA = ["High-tetra", "Low-tetra", "parapalegia", "multiple scaroliosis"]

Patient.create!(patient_id:99999, first_name:'Albert', last_name: 'Wong', ssn:'443-22-1234', dob:'02/04/1961')

require 'rubygems'
require 'faker'

EpisodeOfCare.delete_all
Patient.delete_all

def date_between(from=0.0, to=Time.now)
  Time.at(from + rand * (to.to_f - from.to_f)).to_date
end

for i in 1..10
  dob = Faker::Date.between(80.years.ago, 18.years.ago)
  dod = [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample
  patient_data = {
      patient_id: i,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      ssn:  Faker::Number.number(3) + '-' + Faker::Number.number(2) + '-' + Faker::Number.number(3),
      dob:  dob,
      employment_status: [ :Employed, :Unemployed ].sample,
      highest_level_of_education: [ :"No Diploma", :"High School", :"Some College", :"Graduate School" ].sample,
      registration_status: [ :"Currently Served", :"Not Served" ].sample,
      date_of_death: [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample,
      sci_network: [true, false].sample,
      outcome_coordinator: Faker::Name.name,
  }
  patient = Patient.create!(patient_data)


  # AR
  start_fim = Faker::Number.between(18, 126)
  start_asia = ASIA.sample
  start_kurtzke_edss = Faker::Number.between(1, 100) / 1.0
  admission_date = Faker::Date.between(dob+18.years, dod != nil ? dod : Time.new)

  ar_data = {
    episode_date: admission_date.iso8601,
    start_asia: rand(10),
    start_fim: rand(18..126),
    start_swls: rand(5..35),
    start_sf8: rand(5..35),
    goal_fim: rand(18..126),
    finish_asia: rand(10),
    finish_fim: rand(18..126),
    finish_swls: rand(5..35),
    finish_sf8: rand(5..35),
    reason_for_admission: AcuteRehab.reason_for_admissions.keys.sample,
    reason_for_admission_other: Faker::Lorem.sentence(3, false, 10),
    hospital_admission: Faker::Date.between(20.years.ago, Date.today),
    acute_rehab_admission: Faker::Date.between(20.years.ago, Date.today),
    acute_rehab_discharge: Faker::Date.between(20.years.ago, Date.today),
    hospital_discharge: Faker::Date.between(20.years.ago, Date.today),
    residence_type: AcuteRehab.residence_types.keys.sample,
    residence_name: Faker::Company.name,
    discharge_to_community: [true, false].sample,
    followup_90day_date: Faker::Date.between(20.years.ago, Date.today),
    followup_90day_fim: rand(18..126),
    followup_90day_swls: rand(5..35),
    followup_90day_chart_sf: rand(5..35),
    followup_90day_sf8: rand(5..35),
    followup_1yr_date: Faker::Date.between(20.years.ago, Date.today),
    followup_1yr_fim: rand(18..126),
    followup_1yr_swls: rand(5..35),
    followup_1yr_chart_sf: rand(5..35),
    followup_1yr_sf8: rand(5..35)
  }

  acute_rehab = AcuteRehab.new(ar_data)
  patient.episode_of_cares << acute_rehab


  # OMR
  omr_start_fim = Faker::Number.between(18, 126)
  omr_start_asia = ASIA.sample
  start_kurtzke_edss = Faker::Number.between(1, 100) / 1.0
  omr_admission_date = Faker::Date.between(admission_date, dod != nil ? dod : Time.new)

  omr_data = {
      episode_date: omr_admission_date.iso8601,

      admission_date: omr_admission_date.iso8601,
      start_asia: omr_start_asia,
      start_fim: omr_start_fim,
      start_fam: '23',
      start_swls: Faker::Number.between(5, 35),
      start_chart_sf: '23',
      start_sf_8: '23',
      dusoi: '2',
      goal_fim: '1',
      goal_fam: '1',
      omb_completed: Faker::Date.between(omr_admission_date, dod != nil ? dod : Time.new).iso8601,
      finish_asia: ASIA.sample,
      finish_fim: Faker::Number.between(omr_start_fim, 126),
      finish_fam: '45',
      finish_swls: Faker::Number.between(5, 35),
      finish_chart_sf: '24',
      finish_sf_8: '44',
      finish_uspeq: '423',
      discharge_location: 'Home'
  }

  omr = Omr.new(omr_data)
  patient.episode_of_cares << omr

  patient.save

end
