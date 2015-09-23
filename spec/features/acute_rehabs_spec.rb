include Warden::Test::Helpers
Warden.test_mode!

# Feature: Acute Rehab
#   As a user
#   I want to add or edit an acute rehab episode per patient
#   So I can properly record this type of episode of care
feature 'Acute Rehab' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Add Acute Rehab to a patient
  #   Given I am a user
  #   When I add an Acute Rehab to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add Acute Rehab' do
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    expect(page).to have_content "Patient Personal Information"
    expect(find_field('SSN').value).to eql patient1.ssn

    click_link("+ Acute Rehab")
    expect(page).to have_content "New Acute Rehab"

    fill_in "Date of Rehab Admission", with: Time.now

    first(:button, "Create Acute rehab").click
    expect(current_url).to eql edit_patient_url(patient1)

    # TODO(awong.dev): Verify Acute Rehab is added to patient.
  end
end
