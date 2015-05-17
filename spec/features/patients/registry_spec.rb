# Feature: Patient Registry
#   As a user
#   I want to visit the patient registry
#   So I can add and find patients.
feature 'Patient Registry' do

  # Scenario: Visit the patient registry.
  #   Given I am a user
  #   When I patient registry
  #   Then I see all patients in the database.
  scenario 'visit patient registry' do
    visit patients_path
    pending("Fake a login")
    expect(page).to have_content 'SCI Patient Registry'
    expect(page).to have_no_content 'You need to sign in'
  end
end

