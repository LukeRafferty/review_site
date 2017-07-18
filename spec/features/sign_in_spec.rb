require 'rails_helper'

feature 'User Logs in' do

  # As an unauthenticated user
  # I want to sign in
  # So that I can post items and review them

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign out")

  end

  scenario 'a nonexistant email and password in supplied'

  scenario 'an existing email with the wrong password is denied access'

  scenario 'an already authenticated user cannot re-sign in'
end
