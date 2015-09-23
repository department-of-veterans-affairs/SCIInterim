include Warden::Test::Helpers
Warden.test_mode!

# Feature: Patient Registry
#   As a user
#   I want to visit the patient registry
#   So I can add and find patients.
feature 'Patient Registry' do
  after(:each) do
    Warden.test_reset!
  end

  let (:read_only_attributes) {
    [
      'scido_id',
      'address',  # TODO(awong): Nested attribute needs to be handled.
      'caregiver_address',  # TODO(awong): Nested attribute needs to be handled.
    ]
  }

  let (:nested_attributes) {
    Patient.nested_attributes_options.map { |k,v| k.to_s }
  }

  let (:writable_attributes) {
    belongs_to_fks = Patient.reflect_on_all_associations(:belongs_to).map { |a| a.foreign_key }
    belongs_to_names = Patient.reflect_on_all_associations(:belongs_to).map { |a| a.name.to_s }
    (remove_read_only_attributes(Patient.attribute_names) - belongs_to_fks + belongs_to_names - nested_attributes - read_only_attributes)
  }

  # Scenario: See all patients in the database
  #   Given I am a user
  #   When I patient registry
  #   Then I see all patients in the database.
  scenario 'See all patients in the database' do
    sign_in_user
    patient1 = create(:patient, id: 1)
    patient2 = create(:patient, id: 2)

    visit patients_path

    expect(page).to have_content 'SCI Interim'
    expect(page).to have_content patient1.first_name
    expect(page).to have_content patient2.first_name
  end

  # Scenario: Form allows updated of all expected fields.
  #   Given I am a user
  #   When I edit a patient
  #   Then I can update all read-write fields
  scenario 'Edit all patient fields' do
    pending("Support hidden elements in test runner")
    sign_in_user
    patient = create(:patient)

    visit edit_patient_path(patient)

    writable_attributes.each { |attribute_name| modify_for_test(patient, {}, attribute_name) }
    patient.ssn = '000-12-1111'  # Override the default modify_for_test since it doesn't understand ssn format.
    writable_attributes.each { |attribute_name| model_to_form('patient', attribute_name, patient) }

    click_button 'Update Patient'

    saved_patient = Patient.find(patient.id)
    writable_attributes.each { |attribute_name| expect_eql_attributes(saved_patient, patient, attribute_name) }
  end

  # Scenario: Form creates new patient preserving all fields
  #   Given I am a user
  #   When I create a patient
  #   Then I can specify all read-write fields
  scenario 'Create patient preserves all fields' do
    pending("Support hidden elements in test runner")
    sign_in_user
    patient = build(:patient)

    visit new_patient_path

    writable_attributes.each { |attribute_name| model_to_form('patient', attribute_name, patient) }

    click_button 'Create Patient'

    expect(Patient.all.length).to eql(1)
    saved_patient = Patient.first
    writable_attributes.each { |attribute_name| expect_eql_attributes(saved_patient, patient, attribute_name) }
  end

  # Scenario: Country defaults to US
  #   Given I am a user
  #   When I create a new patient
  #   The Country in the address field defaults to the US
  scenario 'Default to US for address country' do
    sign_in_user

    visit new_patient_path

    expect(find_field('patient[address_attributes][country]').value).to eql("US")
  end
end

