# Feature: User Registration
#   As a new user
#   I want to create an account
#   So I can access protected pages.
feature "Registration" do

  # Scenario: Visit the sign up page
  #   Given I am a new user
  #   When I attempt to sign up for a new account with blank info
  #   Then I see proper flash error message for the invalid fields
  scenario "Users can't sign up with blank info" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: '   '
    fill_in 'Password', with: '   '
    click_on 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
  end

  # Scenario: Visit the sign up page
  #   Given I am a new user
  #   When I attempt to sign up for a new account with mismatched passwords
  #   Then I see proper flash error message for the mismatch
  scenario "Users can't sign up with mismatched passwords" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'wrongpass'
    click_on 'Sign up'
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  # Scenario: Visit the sign up page
  #   Given I am a new user
  #   When I attempt to sign up for a new account a too short password
  #   Then I see proper flash error message indicating the miminum length.
  scenario "Users can't sign up with password less than 8 characters" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Password', with: 'four'
    fill_in 'Password confirmation', with: 'four'
    click_on 'Sign up'
    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

  # Scenario: Visit the sign up page
  #   Given I am a new user
  #   When I attempt to sign up for a new account with all the proper info
  #   Then I will be granted access to the logged views.
  scenario "Users can sign up with valid information" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within('.actions') do
      click_on 'Sign up'
    end
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
