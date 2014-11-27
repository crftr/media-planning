When(/^I have an AdvertisingType, "(.*?)"$/) do |name|
  AdvertisingType.create(name: name, user: @current_user, media_type: FactoryGirl.create(:media_type))
end

When(/^I add an AdvertisingType "(.*?)"$/) do |name|
  media_type = FactoryGirl.create(:media_type, user: @current_user)
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Advertising Type'
  select media_type.name, from: 'Media type'
  fill_in 'Name of type', with: name
  click_on 'Save new advertising type'
end

Then(/^I should see the advertising type "(.*?)" on my AdvertisingType index$/) do |name|
  visit advertising_types_path
  expect(page).to have_content(name)
end
