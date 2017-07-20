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
end
