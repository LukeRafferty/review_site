require "rails_helper"

feature 'user visits the restaurant index page' do
  scenario 'correctly displays the index page with one restaurant' do
    restaurant = FactoryGirl.create(:restaurant)
    visit restaurants_path
    expect(page).to have_content('Burgerzone')
  end

  scenario 'displays an index page with many restaurants' do
    restaurant1 = FactoryGirl.create(:restaurant)
    restaurant2 = Restaurant.create(name: "Burgerland", address: "addro", city: "Chicago", zip_code: "string", state: "MA", description: "sup")
    visit restaurants_path
    expect(page).to have_content('Burgerzone')
    expect(page).to have_content('Burgerland')
  end
end
