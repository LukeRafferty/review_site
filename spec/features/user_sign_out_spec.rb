require "rails_helper"
require 'pry'
#as a user, I want to be able to sign out

feature "user signs out" do

  scenario "User is signed in and sees the button and can click it and sign out" do
    visit new_user_registration_path
    fill_in 'Username', with: 'John'
    fill_in 'Email', with: "example@example.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content('Sign Out')

    click_on 'Sign Out'

    expect(page).to have_content('Sign In')
  end


end
