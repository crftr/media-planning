When(/^I have an engagment, "(.*?)"$/) do |engagement_name|
  @client = FactoryGirl.create(:client, user: @current_user)
  FactoryGirl.create(:engagement, name: engagement_name, client: @client)
end

When(/^I add an engagement "(.*?)" under the client "(.*?)"$/) do |engagement_name, client_name|
  @client = @current_user.clients.find_by(name: client_name) ||
    FactoryGirl.create(:client, name: client_name, user: @current_user)
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Engagement'
  select client_name, from: 'Client'
  fill_in 'Engagement name', with: engagement_name
  click_on 'Save new engagement'
end

Then(/^I should see the engagement "(.*?)" on my engagement index$/) do |engagement_name|
  visit engagements_path
  expect(page).to have_content(engagement_name)
end
