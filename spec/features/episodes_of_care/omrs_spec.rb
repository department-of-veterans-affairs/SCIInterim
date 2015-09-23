include Warden::Test::Helpers
Warden.test_mode!

# Feature: OMR
#   As a user
#   I want to add or edit OMR entries per patient
#   So I can properly record this type of episode of care
feature 'OMR' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Add OMR to a patient
  #   Given I am a user
  #   When I add an OMR to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add OMR' do
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    expect(page).to have_content "Patient Personal Information"
    expect(find_field('SSN').value).to eql patient1.ssn

    click_link("+ OMR")
    expect(page).to have_content "OMR"

    fill_in "Date of Admission", with: Time.now

    first(:button, "Create Omr").click
    expect(current_url).to eql edit_patient_url(patient1)

    # TODO(awong.dev): Verify OMR shows.
  end
end