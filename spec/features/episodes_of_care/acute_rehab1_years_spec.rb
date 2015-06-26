include Warden::Test::Helpers
Warden.test_mode!

# Feature: Acute Rehab 1 year Followup
#   As a user
#   I want to add or edit acute rehab 1 year followup per patient
#   So I can properly record this type of episode of care
feature 'Acute Rehab 1 Year Followup' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Add Acute Rehab 1 year Followup to a patient
  #   Given I am a user
  #   When I add an Acute Rehab 1 year Followup to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add Acute Rehab 1 year Followup' do
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    expect(page).to have_content "Personal Information"
    expect(page).to have_content patient1.ssn

    click_link("Acute Rehab 1 year")
    expect(page).to have_content "New Acute Rehab 1 year Followup"

    fill_in "Episode date", with: Time.now

    click_button("Create Acute rehab1 year")
    current_url.should == edit_patient_url(patient1)

    # TODO(awong.dev): Verify Acute Rehab 1 year shows.
  end
end
