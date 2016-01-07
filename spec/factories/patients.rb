FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :patient do
    created_at Time.now
    updated_at Time.now

    address { create(:address) }
    acute_rehabs { rand(1..3).times.map { create(:acute_rehab) } }
    annual_evaluations { rand(1..3).times.map { create(:annual_evaluation) } }
    asia { create(:asia) }
    assigned_sci_hub { Domain::SciHub.all.sample }
    assigned_sci_hub_physician_first_name { Faker::Name.first_name }
    assigned_sci_hub_physician_last_name { Faker::Name.last_name }
    assigned_vamc { Domain::VaMedicalCenter.all.sample }
    benefits_waiver_exemption_date { Faker::Date.between(100.years.ago, Date.today) }
    caregiver_address { create(:address) }
    caregiver_first_name { Faker::Name.first_name }
    caregiver_last_name { Faker::Name.last_name }    
    current_occupation { Domain::Occupation.all.sample }
    date_of_injury { Faker::Date.between(100.years.ago, Date.today) }
    dob { Faker::Date.between(100.years.ago, Date.today) }
    ethnic { Domain::Ethnic.all.sample }
    first_name { Faker::Name.first_name }
    gender { Domain::Gender.all.sample }
    has_caregiver { Domain::CaregiverType.all.sample }
    highest_level_of_education { Domain::HighestLevelOfEducation.all.sample }
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
    notes { Faker::Lorem.paragraphs.join(" ") }
    omrs { rand(1..3).times.map { create(:omr) } }
    occupation_at_time_of_injury { Domain::Occupation.all.sample }
    preferred_sci_hub { Domain::SciHub.all.sample }
    preferred_sci_hub_physician_first_name { Faker::Name.first_name }
    preferred_sci_hub_physician_last_name { Faker::Name.last_name }
    principle_pcp_va_nonva { Domain::PrinciplePcpType.all.sample }
    race { Domain::Race.all.sample }
    residence_type { Domain::ResidenceType.all.sample }
    sci_arrival_date { Faker::Date.between(100.years.ago, Date.today) }
    sci_service_connected { [true, false].sample }
    sci_type { Domain::SciType.all.sample }
    scid_eligibility { Domain::ScidEligibility.all.sample }
    scid_eligibility_other { Faker::Lorem.sentence(4) }
    scid_etiology { Domain::ScidEtiology.all.sample }
    scid_ms_eligibility { Domain::ScidMsEligibility.all.sample }
    scido_id 1
    ssn "123-45-6789"
    theater_of_service { Domain::TheaterOfService.all.sample }
    travel_status { Domain::TravelStatus.all.sample }
    va_facility { Domain::VaMedicalCenter.all.sample }
    va_facility_pcp_first_name { Faker::Name.first_name }
    va_facility_pcp_last_name { Faker::Name.last_name }
    va_status { Domain::VaStatus.all.sample }

    after(:build) do |patient|
      patient.scid_ms_eligibility = nil unless patient.scid_eligibility_ms?
    end
  end
end
