# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

ASIA = ["High-tetra", "Low-tetra", "parapalegia", "multiple scaroliosis"]

require 'rubygems'
require 'faker'

EpisodeOfCare.delete_all
Patient.delete_all

def date_between(from=0.0, to=Time.now)
  Time.at(from + rand * (to.to_f - from.to_f)).to_date
end

for i in 1..50
  dob = Faker::Date.between(80.years.ago, 18.years.ago)
  dod = [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample
  patient_data = {
    scido_id: rand(200000),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name + 'Fake',
    ssn: ["000", "666"].sample + '-' + Faker::Number.number(2) + '-' + Faker::Number.number(4),
    dob: Faker::Date.between(100.years.ago, Date.today),
    highest_level_of_education: Patient.highest_level_of_educations.keys.sample,
    occupation_at_time_of_injury: Faker::Lorem.sentence(3),
    gender: Patient.genders.keys.sample,
    # TODO(awong): Add address 
    my_healthevet_messaging: [true, false].sample,
    sci_service_connected: [true, false].sample,
    travel_status: Patient.travel_statuses.keys.sample,
    benefits_waiver_exemption_date: Faker::Date.between(100.years.ago, Date.today),
    va_status: Patient.va_statuses.keys.sample,
    assigned_vamc: rand(10),
    assigned_sci_hub: rand(10),
    assigned_sci_hub_physician_first_name: Faker::Name.first_name,
    assigned_sci_hub_physician_last_name: Faker::Name.last_name,
    preferred_sci_hub: rand(10),
    preferred_sci_hub_physician_first_name: Faker::Name.first_name,
    preferred_sci_hub_physician_last_name: Faker::Name.last_name,
    non_va_facility_name: Faker::Company.name,
    non_va_facility_contact: Faker::Name.name,
    non_va_facility_phone_number: Faker::PhoneNumber.phone_number,
    non_va_facility_fax_number: Faker::PhoneNumber.phone_number,
    non_va_facility_pcp_first_name: Faker::Name.first_name,
    non_va_facility_pcp_last_name: Faker::Name.last_name,
    va_facility: Faker::Company.name,
    va_facility_pcp_first_name: Faker::Name.first_name,
    va_facility_pcp_last_name: Faker::Name.last_name,
    theater_of_service: Patient.theater_of_services.keys.sample,
    sci_arrival_date: Faker::Date.between(100.years.ago, Date.today),
    is_injured_on_active_duty: [true, false].sample,
    sci_type: Patient.sci_types.keys.sample,
    date_of_injury: Faker::Date.between(100.years.ago, Date.today),
    level_of_injury: Patient.level_of_injuries.keys.sample,
    asia_level: Patient.asia_levels.keys.sample,
    is_asia_complete: [true, false].sample,
    current_occupation: Faker::Lorem.sentence(1, false, 4),
    # TODO(awong): Move residence type into a concer.
    residence_type: AcuteRehab.residence_types.keys.sample,
    residence_name: Faker::Company.name,
    has_caregiver: [true, false].sample,
    # TODO(awong): Create a caregiver_address 
    is_receiving_non_va_care: [true, false].sample,
    non_va_care_hours_per_month: rand(1000),
    non_va_caregiver_receiving_reimbursement: Faker::Company.name,
    last_fee_basis_evaluation_date: Faker::Date.between(100.years.ago, Date.today),
    is_receiving_hhha: [true, false].sample,
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
