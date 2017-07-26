require "rails_helper"
feature 'user adds a new review' do
  scenario 'user can, in fact, add a review' do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit restaurant_path(restaurant.id)
    click_on 'Add Review'
    expect(page).to have_content(restaurant.name)
    fill_in 'Body', with: 'YUM'
    fill_in 'Rating', with: '4'
    click_on 'Add Review'
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content('Review Added Successfully')
  end

  scenario "user attempts to submit empty form" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit restaurant_path(restaurant.id)
    click_on 'Add Review'
    click_on 'Add Review'
    expect(page).to have_content('error!')
    expect(page).to have_content("New Review Form for: #{restaurant.name}")
  end

  scenario "user attempts to submit half-filled out form" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit restaurant_path(restaurant.id)
    click_on 'Add Review'
    fill_in "Body", with: 'I only want to fill in this!'
    click_on 'Add Review'
    expect(page).to have_content('error!')
    expect(page).to have_content('can\'t be blank')
    expect(page).to have_content("New Review Form for: #{restaurant.name}")
  end

  scenario "user is not signed in" do
    user = FactoryGirl.create(:user, admin: false)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    visit restaurant_path(restaurant.id)
    click_on 'Add Review'
    expect(page).to have_content('You must be signed in to add a review!')
  end
end
