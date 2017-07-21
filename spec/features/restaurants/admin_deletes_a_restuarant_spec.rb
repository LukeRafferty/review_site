require "rails_helper"

feature "admin can delete a restaurant" do

  scenario "admins can actually delete restaurants" do

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
    expect(page).to have_content "destroy"

    click_on "destroy"

    expect(page).to have_content("Restaurant was successfully deleted")

  end
  scenario "users cannot delete restaurants" do
    restaurant1 = FactoryGirl.create(:restaurant)
    user = FactoryGirl.create(:user, admin: false)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit restaurant_path(restaurant1.id)

    expect(page).to have_content "Burgerzone"
    expect(page).to_not have_content "destroy"
  end
end
