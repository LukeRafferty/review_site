require "rails_helper"
feature "website sends email to admin when reivew is posted on a restaurant" do
  scenario "someone reviews a restaurant" do

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
  scenario "incomplete review form sends no email" do
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
    click_button 'Add Review'
    expect(page).to have_content('error!')
    expect(page).to have_content('can\'t be blank')
    expect(page).to have_content("New Review Form for: #{restaurant.name}")

    expect(ActionMailer::Base.deliveries.count).to eq(0)

  end


end
