require "rails_helper"

feature "user edits profile" do
  scenario "changes everything" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_on "Edit Profile"
    fill_in 'Email', with: 'newemail@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully")
  end

  scenario "changes email" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_on "Edit Profile"
    fill_in 'Email', with: 'newemail@example.com'
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully")
  end

  scenario "changes password" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_on "Edit Profile"
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully")
  end

end
