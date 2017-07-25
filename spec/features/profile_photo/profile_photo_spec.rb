require "rails_helper"

feature "profile photo" do
  scenario "user upload profile photo" do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Username', with: 'John'
    fill_in 'Email', with: "example@example.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    check 'Admin?'
    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/image.png"
    click_button 'Sign Up'

    expect(page).to have_css("img[src*='image.png']")

  end
end
