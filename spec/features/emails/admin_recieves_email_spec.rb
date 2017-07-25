require "rails_helper"
feature "website sends email to admin when reivew is posted on a restaurant" do
  scenario "review a product" do

  user = FactoryGirl.create(:user, admin: false)
  restaurant = FactoryGirl.create(:restaurant, user_id: user.id)


  visit root_path
  click_on "Sign In"
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'

  visit restaurant_path(restaurant.id)

  click_button 'Add Review'
  expect(page).to have_content(restaurant.name)
  fill_in 'Body', with: 'Total garbage'
  fill_in 'Rating', with: '3'
  click_button 'Add Review'
  expect(page).to have_content(restaurant.name)
  expect(page).to have_content('Review Added Successfully')

  expect(ActionMailer::Base.deliveries.count).to eq(1)
  end


end
