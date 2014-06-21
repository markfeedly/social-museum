Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end