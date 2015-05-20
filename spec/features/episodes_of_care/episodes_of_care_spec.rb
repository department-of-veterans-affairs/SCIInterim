include Warden::Test::Helpers
Warden.test_mode!

# Feature: Episodes of Care
#   As a user
#   I want to view and modify a patient record
#   So I can add and view all episodes of care
feature 'Episodes of Care' do
  after(:each) do
    Warden.test_reset!
  end

  # Scenario: All Episode of Care types can be added and viewed
  #   Given I am a user
  #   When I patient registry
  #   Then I see all patients in the database.
  scenario 'See all patients in the database' do
    skip("Not implemented because the view isn't defined yet")
    sign_in_user
    patient1 = create(:patient)
    visit edit_patient_path(patient1)

    ar = create(:acute_rehab)

    expect(page).to have_content "Basic Patient Info"
    expect(page).to have_content patient1.ssn
  end
end

