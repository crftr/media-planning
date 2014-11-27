
Then(/^I should be on the homepage$/) do
  expect(current_path).to eq(root_path)
end

Then(/^I should be on my dashboard$/) do
  expect(current_path).to eq(user_path(@current_user))
end