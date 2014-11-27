When(/^I have a CampaignType, "(.*?)"$/) do |campaign_name|
  CampaignType.create(name: campaign_name, user: @current_user)
end

When(/^I add a CampaignType "(.*?)"$/) do |campaign_name|
  visit user_path(@current_user)
  click_link 'quick-add'
  click_on 'New Campaign Type'
  fill_in 'Name of type', with: campaign_name
  click_on 'Save new campaign type'
end

Then(/^I should see the campaign type "(.*?)" on my CampaignType index$/) do |campaign_name|
  visit campaign_types_path
  expect(page).to have_content(campaign_name)
end