include Warden::Test::Helpers
Warden.test_mode!

# Feature: Acute Rehab 90 day
#   As a user
#   I want to add or edit 90 day followups for Acute Rehab per patient
#   So I can properly record this type of episode of care
feature 'Acute Rehab 90 day Followup' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Add Acute Rehab 90 day Followup to a patient
  #   Given I am a user
  #   When I add an Acute Rehab 90 day Followup entires to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add Acute Rehab 90 day Followup' do
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    expect(page).to have_content "Personal Information"
    expect(page).to have_content patient1.ssn

    click_link("Acute Rehab 90 day")
    expect(page).to have_content "New Acute Rehab 90 day Followup"

    fill_in "Episode date", with: Time.now

    click_button("Create Acute rehab90 day")
    current_url.should == edit_patient_url(patient1)

    # TODO(awong.dev): Verify Acute Rehab 90 day shows.
  end
end
