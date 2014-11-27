include Warden::Test::Helpers
Warden.test_mode!

def create_visitor
  @visitor_password = 'Secret_123!'
  @visitor ||= FactoryGirl.create(:user, password: @visitor_password)
end

def force_create_user(args = @visitor)
  FactoryGirl.create(:user, args)
end

def manual_sign_in(username: @visitor.username, password: @visitor_password)
  visit new_user_session_path
  fill_in 'user_username', with: username
  fill_in 'user_password', with: password
  click_on 'Sign in'
  @current_user = User.find_by!(username: username)
end

def force_sign_in(user: @visitor)
  login_as(user, scope: :user)
  @current_user = user
end

## Step definitions

Given(/^a user with username "(.*?)" and password "(.*?)"$/) do |user, pass|
  force_create_user(username: user, password: pass)
end

When(/^I sign in manually as "(.*?)" with password "(.*?)"$/) do |user, pass|
  manual_sign_in username: user, password: pass
end

Then(/^I should see the sign in success message$/) do
  expect(page).to have_content('Signed in successfully.')
end

Given(/^I am signed in$/) do
  create_visitor
  force_sign_in
end

When(/^I sign out$/) do
  visit destroy_user_session_path
end

Then(/^I should see the sign out message$/) do
  expect(page).to have_content('Signed out successfully.')
end