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

  # Scenario: See all patients in the database
  #   Given I am a user
  #   When I patient registry
  #   Then I see all patients in the database.
  scenario 'See all patients in the database' do
    sign_in_user
    patient1 = create(:patient, id: 1)
    patient2 = create(:patient, id: 2)

    visit patients_path

    expect(page).to have_content 'SCI Patient Registry'
    expect(page).to have_content patient1.first_name
    expect(page).to have_content patient2.first_name
  end
end

