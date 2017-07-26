require "rails_helper"

feature "admin can delete a restaurant" do

  scenario "admins can actually delete restaurants" do

    admin = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Log in'
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
    expect(page).to have_content "Destroy"

    click_on "Destroy"

    expect(page).to have_content("Restaurant was successfully deleted")
    expect(page).to_not have_content "Burger King"
  end

  scenario "users cannot delete restaurants" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant1 = FactoryGirl.create(:restaurant, user_id: user.id)

    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit restaurant_path(restaurant1.id)

    expect(page).to have_content "Burgerzone"
    expect(page).to_not have_content "Destroy"
  end


end
