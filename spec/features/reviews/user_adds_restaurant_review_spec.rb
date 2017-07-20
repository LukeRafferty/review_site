require "rails_helper"
feature 'user adds a new review' do
  scenario 'user can, in fact, add a review' do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit restaurant_path(restaurant.id)
    click_button 'Add Review'
    expect(page).to have_content(restaurant.name)
    fill_in 'Body', with: 'YUM'
    fill_in 'Rating', with: '4'
    click_button 'Add Review'
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content('Review Added Successfully')
  end

  scenario "user attempts to submit empty form" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit restaurant_path(restaurant.id)
    click_button 'Add Review'
    click_button 'Add Review'
    expect(page).to have_content('error!')
    expect(page).to have_content("New Review Form for: #{restaurant.name}")
  end

  scenario "user attempts to submit half-filled out form" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit restaurant_path(restaurant.id)
    click_button 'Add Review'
    fill_in "Body", with: 'I only want to fill in this!'
    click_button 'Add Review'
    expect(page).to have_content('error!')
    expect(page).to have_content('can\'t be blank')
    expect(page).to have_content("New Review Form for: #{restaurant.name}")
  end

  scenario "user is not signed in" do
    restaurant = FactoryGirl.create(:restaurant)
    visit restaurant_path(restaurant.id)
    click_button 'Add Review'
    expect(page).to have_content('You must be signed in to add a review!')
  end
end
