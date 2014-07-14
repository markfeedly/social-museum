Then(/^I can see a page with title "(.*?)"$/) do |title|
  page.should have_content(title)
end

Then(/^I can see a "Title has already been taken" error message$/) do
  page.should have_content("Title has already been taken")
end