Given(/^"(.*?)" exists as a user$/) do |user_name|
  create_user(user_name)
end

Given(/^"(.*?)" is signed in$/) do |user_name|
  sign_in(user_name)
end

When(/^"(.*?)" creates a comment "(.*?)" on page entitled "(.*?)"$/) do |user_name, comment, page_title|
  visit "/pages/#{Page.find_by_title(page_title).slug}"
  click_on 'Add a comment'
  fill_in 'comment[content]', with: comment
  click_on 'Add comment'
  within( '#comments') do
    page.should have_content(comment)
  end
end

Then(/^I am emailed about a comment "(.*?)" on page entitled "(.*?)"$/) do |comment, page_title|
  unread_emails_for(user_email).size.should == 1
  open_last_email
  # ...
  click_email_link_matching /See page and comment/
end