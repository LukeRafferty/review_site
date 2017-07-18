require 'rails_helper'

feature 'User Logs in' do

  # As an unauthenticated user
  # I want to sign in
  # So that I can post items and review them

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")

  end

  scenario 'an existing admin specifies a valid email and password' do
    user = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")

  end

  scenario 'a nonexistent email and password is supplied' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'

    expect(page).to have_content("Invalid Email or password")

  end

  scenario 'an existing user email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrectPassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'an existing admin email with the wrong password is denied access' do
    user = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrectPassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end

  scenario 'an already authenticated admin cannot re-sign in' do
    user = FactoryGirl.create(:user, admin: true)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end
end
