include Warden::Test::Helpers
Warden.test_mode!

# Feature: OMR 90 day Followup
#   As a user
#   I want to add or edit 90 day followup OMR entries per patient
#   So I can properly record this type of episode of care
feature 'OMR 90 Day Followup' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Add OMR 90 Day Followup to a patient
  #   Given I am a user
  #   When I add an OMR 90 Day Followup to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add OMR 90 Day Followup' do
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    expect(page).to have_content "Personal Information"
    expect(page).to have_content patient1.ssn

    click_link("OMR 90 day")
    expect(page).to have_content "New OMR 90 Day Followup"

    fill_in "Episode date", with: Time.now

    click_button("Create Omr90 day")
    current_url.should == edit_patient_url(patient1)

    # TODO(awong.dev): Verify OMR 90 day shows.
  end
end
