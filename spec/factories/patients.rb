FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :patient do
    created_at Time.now
    updated_at Time.now

    address { create(:address) }
    acute_rehabs { rand(1..3).times.map { create(:acute_rehab) } }
    annual_evaluations { rand(1..3).times.map { create(:annual_evaluation) } }
    asia_assessment { create(:asia) }
    assigned_sci_hub { rand(10) }
    assigned_sci_hub_physician_first_name { Faker::Name.first_name }
    assigned_sci_hub_physician_last_name { Faker::Name.last_name }
    assigned_vamc { Patient.collections[:assigned_vamc].sample }
    benefits_waiver_exemption_date { Faker::Date.between(100.years.ago, Date.today) }
    caregiver_address { create(:address) }
    caregiver_first_name { Faker::Name.first_name }
    caregiver_last_name { Faker::Name.last_name }    
    current_occupation { Patient.collections[:current_occupation].sample }
    date_of_injury { Faker::Date.between(100.years.ago, Date.today) }
    dob { Faker::Date.between(100.years.ago, Date.today) }
    first_name { Faker::Name.first_name }
    gender { Patient.collections[:gender].sample }
    has_caregiver { Patient.collections[:has_caregiver].sample }
    highest_level_of_education { Patient.collections[:highest_level_of_education].sample }
    is_on_active_duty { [true, false].sample }
    is_receiving_hhha { [true, false].sample }
    is_receiving_non_va_care { [true, false].sample }
    last_fee_basis_evaluation_date { Faker::Date.between(100.years.ago, Date.today) }
    last_name { Faker::Name.last_name }
    my_healthevet_messaging { [true, false].sample }
    non_va_care_hours_per_month { rand(1000) }
    non_va_facility_fax_number { Faker::PhoneNumber.phone_number }
    non_va_facility_name { Faker::Company.name }
    non_va_facility_pcp_first_name { Faker::Name.first_name }
    non_va_facility_pcp_last_name { Faker::Name.last_name }
    non_va_facility_phone_number { Faker::PhoneNumber.phone_number }
    #omrs { rand(1..3).times.map { create(:omr) } }
    occupation_at_time_of_injury { Patient.collections[:occupation_at_time_of_injury].sample }
    preferred_sci_hub { rand(10) }
    preferred_sci_hub_physician_first_name { Faker::Name.first_name }
    preferred_sci_hub_physician_last_name { Faker::Name.last_name }
    principle_pcp_va_nonva { Patient.collections[:principle_pcp_va_nonva].sample }
    residence_type { Patient.collections[:residence_type].sample }
    sci_arrival_date { Faker::Date.between(100.years.ago, Date.today) }
    sci_service_connected { [true, false].sample }
    sci_type { Patient.collections[:sci_type].sample }
    scid_eligibility { Patient.collections[:scid_eligibility].sample }
    scid_eligibility_other { Faker::Lorem.sentence(4) }
    scid_etiology { Patient.collections[:scid_etiology].sample }
    scido_id 1
    ssn "123-45-6789"
    theater_of_service { Patient.collections[:theater_of_service].sample }
    travel_status { Patient.collections[:travel_status].sample }
    va_facility { Patient.collections[:va_facility].sample }
    va_facility_pcp_first_name { Faker::Name.first_name }
    va_facility_pcp_last_name { Faker::Name.last_name }
    va_status { Domain::VaStatus.all.sample }
  end
end
