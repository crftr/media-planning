
When(/^I am viewing my dashboard$/) do
  visit user_path(@current_user)
end

Then(/^I should see a link to my client list$/) do
  expect(page).to have_link('Show Clients', href: clients_path)
end

Then(/^I should see a link to my engagement list$/) do
  expect(page).to have_link('Show Engagements', href: engagements_path)
end

Then(/^I should see a link to my vendor list$/) do
  expect(page).to have_link('Show Vendors', href: vendors_path)
end

Then(/^I should see a link to add a new client$/) do
  expect(page).to have_link('New Client', href: new_client_path)
end

Then(/^I should see a link to add a new engagement$/) do
  expect(page).to have_link('New Engagement', href: new_engagement_path)
end

Then(/^I should see a link to add a new vendor$/) do
  expect(page).to have_link('New Vendor', href: new_vendor_path)
end
