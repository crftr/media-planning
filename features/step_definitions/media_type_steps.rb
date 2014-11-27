When(/^I have a MediaType, "(.*?)"$/) do |media_type|
  MediaType.create(name: media_type, user: @current_user)
end

When(/^I add a MediaType "(.*?)"$/) do |media_type|
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Media Type'
  fill_in 'Name of type', with: media_type
  click_on 'Save new media type'
end

Then(/^I should see the media type "(.*?)" on my MediaType index$/) do |media_type|
  visit media_types_path
  expect(page).to have_content(media_type)
end
