require "rails_helper"

feature "admin edits restaurant" do

  scenario "goes to the edit page via show page" do

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

    expect(page).to have_link 'Refactor'
    click_on "Refactor"

    expect(page).to have_content("Refactor Restaurant")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip Code")
    expect(page).to have_content("Description")
    expect(find_field('Name').value).to eq "Burger King"

    fill_in "Name", with: "McDOOnalds"
    click_button "Refactor"

    expect(page).to have_content("McDOOnalds")

  end

  

end
