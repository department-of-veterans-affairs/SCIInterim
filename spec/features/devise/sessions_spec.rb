#Feature: User Session
#  As a current user
#  I want to sign in and out
#  So I can access protected pages.
feature "Sessions" do

  #Scenario: Visit the log in page
  #  Given I am a current user
  #  When I attempt to log in with a blank password
  #  Then I see an error message for invalid fields.
  scenario "Users can't sign in with blank password" do
    visit root_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: '   '
    within('.actions') do
      click_on 'Log in'
    end
    expect(page).to have_content('Invalid email or password.')
  end

  #Scenario: Visit the log in page
  #  Given I am a current user
  #  When I attempt to log in with a blank email
  #  Then I see an error message for invalid fields.
  scenario "Users can't sign in with blank email" do
    visit root_path
    fill_in 'Email', with: '   '
    fill_in 'Password', with: 'password'
    within('.actions') do
      click_on 'Log in'
    end
    expect(page).to have_content('Invalid email or password.')
  end

  #Scenario: Visit the log in page
  #  Given I am a current user
  #  When I attempt to log in with a valid credentials
  #  Then I will be granted access to the protected views.
  scenario "Users can sign in with valid information" do
    User.create!(
      email: 'mail@mail.com',
      password: 'password',
    )

    visit root_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'password'
    within('.actions') do
      click_on 'Log in'
    end
    expect(page).to have_content('Signed in successfully.')
  end

  #Scenario: Click the log out link
  #  Given I am a currently logged in user
  #  When I attempt to log out
  #  Then I will no longer have access to protected pages
  scenario "Users can sign out" do
    User.create!(
      email: 'mail@mail.com',
      password: 'password'
    )

    visit root_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'password'
    within('.actions') do
      click_on 'Log in'
    end
    click_on 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
