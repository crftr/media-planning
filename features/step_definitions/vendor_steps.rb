When(/^I have a vendor, "(.*?)"$/) do |vendor_name|
  FactoryGirl.create(:vendor, name: vendor_name, user: @current_user)
end

When(/^I add a vendor "(.*?)"$/) do |vendor_name|
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Vendor'
  fill_in 'Vendor name', with: vendor_name
  click_on 'Save new vendor'
end

Then(/^I should see the vendor "(.*?)" on my vendor index$/) do |vendor_name|
  visit vendors_path
  expect(page).to have_content(vendor_name)
end
