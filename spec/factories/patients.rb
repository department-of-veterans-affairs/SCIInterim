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
    highest_level_of_education { Patient.collections[:highest_level_of_education].sample.id }
    occupation_at_time_of_injury { Patient.collections[:occupation_at_time_of_injury].sample.id }
    gender { Patient.collections[:gender].sample.id }
    address { create(:address) }
    my_healthevet_messaging { [true, false].sample }
    sci_service_connected { [true, false].sample }
    travel_status { Patient.collections[:travel_status].sample.id }
    benefits_waiver_exemption_date { Faker::Date.between(100.years.ago, Date.today) }
    va_status { Patient.collections[:va_status].sample.id }
    assigned_vamc { Patient.collections[:assigned_vamc].sample.id }
    assigned_sci_hub { rand(10) }
    assigned_sci_hub_physician_first_name { Faker::Name.first_name }
    assigned_sci_hub_physician_last_name { Faker::Name.last_name }
    scid_eligibility { Patient.collections[:scid_eligibility].sample.id }
    scid_eligibility_other { Faker::Lorem.sentence(4) }
    scid_etiology { Patient.collections[:scid_etiology].sample.id }
    principle_pcp_va_nonva { Patient.collections[:principle_pcp_va_nonva].sample.id }
    preferred_sci_hub { rand(10) }
    preferred_sci_hub_physician_first_name { Faker::Name.first_name }
    preferred_sci_hub_physician_last_name { Faker::Name.last_name }
    non_va_facility_name { Faker::Company.name }
    non_va_facility_phone_number { Faker::PhoneNumber.phone_number }
    non_va_facility_fax_number { Faker::PhoneNumber.phone_number }
    non_va_facility_pcp_first_name { Faker::Name.first_name }
    non_va_facility_pcp_last_name { Faker::Name.last_name }
    va_facility { Faker::Company.name }
    va_facility_pcp_first_name { Faker::Name.first_name }
    va_facility_pcp_last_name { Faker::Name.last_name }
    theater_of_service { Patient.collections[:theater_of_service].sample.id }
    sci_arrival_date { Faker::Date.between(100.years.ago, Date.today) }
    is_on_active_duty { [true, false].sample }
    sci_type { Patient.collections[:sci_type].sample.id }
    date_of_injury { Faker::Date.between(100.years.ago, Date.today) }
    asia_assessment { create(:asia) }
    current_occupation { Patient.collections[:current_occupation].sample.id }
    # TODO(awong): Move residence type into a concern.
    residence_type { Patient.collections[:residence_type].sample.id }
    has_caregiver { Patient.collections[:has_caregiver].sample.id }
    caregiver_address { create(:address) }
    caregiver_first_name { Faker::Name.first_name }
    caregiver_last_name { Faker::Name.last_name }    
    is_receiving_non_va_care { [true, false].sample }
    non_va_care_hours_per_month { rand(1000) }
    last_fee_basis_evaluation_date { Faker::Date.between(100.years.ago, Date.today) }
    is_receiving_hhha { [true, false].sample }
  end
end
