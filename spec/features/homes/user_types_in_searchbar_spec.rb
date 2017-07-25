require "rails_helper"

feature "search bar: " do

  before(:each) do
    admin = FactoryGirl.create(:user, admin: true)
    restaurant = FactoryGirl.create(:restaurant)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit root_path
  end

  scenario "user searches for existing restaurant with the full term" do
    fill_in "search", with: "Burgerzone"
    click_button "Search"

    expect(page).to have_content("Burgerzone")
    expect(page).to have_content("delicious")
    expect(page).to_not have_content("No results for")
  end

  scenario "user searches for existing restaurant with half the term" do
    fill_in "search", with: "zone"
    click_button "Search"

    expect(page).to have_content("Burgerzone")
    expect(page).to have_content("delicious")
    expect(page).to_not have_content("No results for")

    visit root_path
    fill_in "search", with: "gerzo"
    click_button "Search"

    expect(page).to have_content("Burgerzone")
    expect(page).to have_content("delicious")
    expect(page).to_not have_content("No results for")
  end

  scenario "user searches for nonexisting restaurant" do
    fill_in "search", with: "nonexisting restaurant"
    click_button "Search"

    expect(page).to have_content("No results for 'nonexisting restaurant'")
    expect(page).to_not have_content('delicious')
  end

  scenario "user types invalid query in search bar" do
    fill_in "search", with: ""
    click_button "Search"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("No results for")

    visit root_path
    fill_in "search", with: " "
    click_button "Search"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("No results for")

    visit root_path
    fill_in "search", with: "a"
    click_button "Search"
    expect(current_path).to eq(restaurants_path)
    expect(page).to_not have_content("No results for")

    visit root_path
    fill_in "search", with: "!"
    click_button "Search"
    expect(current_path).to eq(restaurants_path)
    expect(page).to_not have_content("No results for")

  end

end
