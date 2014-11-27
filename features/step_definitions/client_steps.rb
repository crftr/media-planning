Given(/^I have a client, "(.*?)"$/) do |client_name|
  FactoryGirl.create(:client, user: @current_user, name: client_name)
end

When(/^I add a client, "(.*?)"$/) do |client_name|
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Client'
  fill_in 'Client name', with: client_name
  click_on 'Save new client'
end

Then(/^I should see the client "(.*?)" on my client index$/) do |client_name|
  visit clients_path
  expect(page).to have_content(client_name)
end
