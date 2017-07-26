require "rails_helper"

feature "account deletion" do
  scenario "user deletes account successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    click_on "Edit Profile"
    fill_in 'Email', with: 'newemail@example.com'
    click_on 'Cancel my account'

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
