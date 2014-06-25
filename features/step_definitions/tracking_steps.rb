Given(/^"(.*?)" exists as a user$/) do |user_name|
  create_user(user_name)
end

Given(/^"(.*?)" is signed in$/) do |user_name|
  sign_in(user_name)
end

When(/^"(.*?)" creates a comment "(.*?)" on page entitled "(.*?)"$/) do |user_name, comment, page_title|
  visit "/pages/#{page_title.downcase}"
  click_on 'Add a comment'
  fill_in 'comment[content]', with: comment
  click_on 'Add comment'
  page.should have_content(comment)
end

Then(/^I am emailed about a comment "(.*?)" on page entitled "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end