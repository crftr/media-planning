When(/^I have a contract, "(.*?)"$/) do |name|
  FactoryGirl.create(:contract, campaign_name: name, user: @current_user)
end

Then(/^I should see the contract "(.*?)" on my contract index$/) do |name|
  visit contracts_path
  expect(page).to have_content(name)
end
