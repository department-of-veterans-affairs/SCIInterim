feature "Sessions" do

  scenario "Users can't sign in with blank password" do
    visit root_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: '   '
    within('.actions') do
      click_on 'Log in'
    end
    expect(page).to have_content('Invalid email or password.')
  end

  scenario "Users can't sign in with blank email" do
    visit root_path
    fill_in 'Email', with: '   '
    fill_in 'Password', with: 'password'
    within('.actions') do
      click_on 'Log in'
    end
    expect(page).to have_content('Invalid email or password.')
  end

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
