FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :patient do
    created_at Time.now
    updated_at Time.now

    scido_id 1
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    ssn "123-45-6789"
    dob { Faker::Date.between(100.years.ago, Date.today) }
    highest_level_of_education { Patient.highest_level_of_educations.keys.sample }
    occupation_at_time_of_injury { Faker::Lorem.sentence(3) }
    gender { Patient.genders.keys.sample }
    address { create(:address) }
    my_healthevet_messaging { [true, false].sample }
    sci_service_connected { [true, false].sample }
    travel_status { Patient.travel_statuses.keys.sample }
    benefits_waiver_exemption_date { Faker::Date.between(100.years.ago, Date.today) }
    va_status { Patient.va_statuses.keys.sample }
    assigned_vamc { rand(10) }
    assigned_sci_hub { rand(10) }
    assigned_sci_hub_physician_first_name { Faker::Name.first_name }
    assigned_sci_hub_physician_last_name { Faker::Name.last_name }
    preferred_sci_hub { rand(10) }
    preferred_sci_hub_physician_first_name { Faker::Name.first_name }
    preferred_sci_hub_physician_last_name { Faker::Name.last_name }
    non_va_facility_name { Faker::Company.name }
    non_va_facility_contact { Faker::Name.name }
    non_va_facility_phone_number { Faker::PhoneNumber.phone_number }
    non_va_facility_fax_number { Faker::PhoneNumber.phone_number }
    non_va_facility_pcp_first_name { Faker::Name.first_name }
    non_va_facility_pcp_last_name { Faker::Name.last_name }
    va_facility { Faker::Company.name }
    va_facility_pcp_first_name { Faker::Name.first_name }
    va_facility_pcp_last_name { Faker::Name.last_name }
    theater_of_service { Patient.theater_of_services.keys.sample }
    sci_arrival_date { Faker::Date.between(100.years.ago, Date.today) }
    is_on_active_duty { [true, false].sample }
    sci_type { Patient.sci_types.keys.sample }
    date_of_injury { Faker::Date.between(100.years.ago, Date.today) }
    level_of_injury { Asia.level_of_injuries.keys.sample }
    asia_level { Asia.classifications.keys.sample }
    is_asia_complete { [true, false].sample }
    current_occupation { Faker::Lorem.sentence(1, false, 4) }
    # TODO(awong): Move residence type into a concer.
    residence_type { AcuteRehab.residence_types.keys.sample }
    residence_name { Faker::Company.name }
    has_caregiver { [true, false].sample }
    caregiver_address { create(:address) }
    is_receiving_non_va_care { [true, false].sample }
    non_va_care_hours_per_month { rand(1000) }
    non_va_caregiver_receiving_reimbursement { Faker::Company.name }
    last_fee_basis_evaluation_date { Faker::Date.between(100.years.ago, Date.today) }
    is_receiving_hhha { [true, false].sample }
  end
end
