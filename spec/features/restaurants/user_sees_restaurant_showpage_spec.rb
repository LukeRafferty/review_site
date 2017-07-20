require "rails_helper"
feature 'user visits the restaurant show page' do
  scenario 'correctly displays the show page with one restaurant' do
    restaurant = FactoryGirl.create(:restaurant)
    visit restaurant_path(restaurant.id)
    expect(page).to have_content('Burgerzone')
    expect(page).to have_content('This street')
    expect(page).to have_content('Burgertown')
    expect(page).to have_content('MA')
    expect(page).to have_content('zip code')
    expect(page).to have_content('delicious')
  end
end
