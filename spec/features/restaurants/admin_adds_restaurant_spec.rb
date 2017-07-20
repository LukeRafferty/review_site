require "rails_helper"

feature 'adds restaurant' do

  scenario 'admin finds new restaurant page' do
      admin = FactoryGirl.create(:user, admin: true)
      visit root_path
      click_on 'Sign In'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Log in'
      click_on 'Admin Tools'
      click_on 'Create New Burger Joint'

      expect(page).to have_content("New Restaurant Form")
  end

  scenario 'admin sees all relative fields for new restaurant form' do
    admin = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit new_restaurant_path

    fill_in 'Name', with: "Burger King"
    fill_in 'Address', with: "78 Summer st"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "MA"
    fill_in 'Zip Code', with: "02111"
    fill_in 'Description', with: "Have it your way!"

    expect(page).to have_button 'Add Restaurant'
    click_on "Add Restaurant"


    expect(page).to have_content "Burger King"
    expect(page).to have_content "78 Summer st"
    expect(page).to have_content "Boston"
    expect(page).to have_content "MA"
    expect(page).to have_content "02111"
    expect(page).to have_content "Have it your way!"
  end

  scenario 'Admin does not fill in all fields' do
    admin = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit new_restaurant_path

    click_on "Add Restaurant"
    expect(page).to have_content 'can\'t be blank'
    expect(page).to have_content 'error!'
  end

  scenario 'regular user cannot add restaurants' do
    pleb = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: pleb.email
    fill_in 'Password', with: pleb.password
    click_button 'Log in'

    expect(page).to_not have_content 'Admin Tools'

    visit "/admin"
    expect(page).to have_content 'Oops!'
    expect(page).to_not have_content 'New Burger Joint'
    visit new_restaurant_path
    expect(page).to have_content 'Oops!'
    expect(page).to_not have_content 'New Restaurant Form'
  end
end
