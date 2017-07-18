require "rails_helper"

#as a user, I want to be able to sign up

feature "user signs up" do

  scenario "Provides all the necessary info" do
    visit root_path
    click_on 'Sign Up'
    expect(page).to_not have_content("Sign Out")

    fill_in 'Username', with: 'John'
    fill_in 'Email', with: "example@example.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    check 'Admin?'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')

  end

  scenario "Does not provide enough information" do
    visit new_user_registration_path
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")

  end

  scenario "password confirmation does not match" do
    visit new_user_registration_path
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'another password'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end


end
