Given(/^"(.*?)" exists as a user$/) do |user_name|
  create_user(user_name)
end

Given(/^"(.*?)" is signed in$/) do |user_name|
  sign_in(user_name)
end

Then(/^I am subscribed to page "(.*?)"$/) do |page_title|
  p = Page.find_by_title(page_title)
  expect(p.subscribers.count).to eq User.first
end


And(/^There is one page with title "(.*?)"$/) do |arg1|
  p = Page.first
  expect(p.name).to eq "Test me"
  expect(Page.count).to eq 1
end

Given(/^I (?:have )?unsubscribed? from page entitled "(.*?)" via the emailed unsubscribe link$/) do |page_title|
  sign_out
  sign_in
  click_email_link_matching(/unsubscribe/)
end

Given(/^I unsubscribe from page entitled "(.*?)" via the page button$/) do |page_title|
  visit pages_path
  page.first(:css, 'a', text: page_title).click
  expect(body).to include(page_title)
  click_on 'Unsubscribe'
end

When(/^I (?:try to )?sign in$/) do
  sign_in
end

When(/^"(.*?)" adds a comment "(.*?)" to the page entitled "(.*?)"$/) do |user_name, comment, page_title|
  previous_user = current_user
  sign_out
  create_user(user_name) unless user_exists?(user_name)
  sign_in(user_name)

  visit pages_path
  page.first(:css, 'a', text: page_title).click

  page.first("[data-role='show-comment-form']").click
  #page.first("[data-role='show-comment-form']").click
  #click_on 'Add a comment'

  fill_in 'comment[content]', with: comment
  click_on 'Add comment'

  if previous_user
    sign_in(previous_user)
  end
end

When(/^"(.*?)" is subscribed to the page (?:entitled )?"(.*?)"$/) do |user_name, page_title|
  previous_user = current_user
  sign_out
  create_user(user_name) unless user_exists?(user_name)
  sign_in(user_name)

  visit pages_path
  page.first(:css, 'a', text: page_title).click
  click_on 'Subscribe'

  if previous_user
    sign_in(previous_user)
  end
end

Then(/^"([^"]+)" is emailed about a comment "([^"]+)" by "([^"]+)" on (?:a |the )?page entitled "(.*?)"$/) do |user, comment, commenter, page_title|
  check_comment_email_content(user, comment, commenter, page_title)
end

Then(/^I am emailed about a comment "([^"]+)" by "([^"]+)" on (?:a |the )?page entitled "(.*?)"$/) do |comment, user, page_title|
  puts 'pages     ' +Page.count.to_s
  puts 'comments  ' +Comment.count.to_s
  check_comment_email_content(current_user, comment, user, page_title)
end

Then(/^I am not emailed$/) do
  expect(unread_emails_for(user_email).size).to eq 0
end

Then(/^I am not emailed about the comment on "([^"]+)"$/) do |page_title|
  expect(unread_emails_for(user_email).select{|email| email.subject =~ Regexp.new(page_title)}.size).to eq 0
end

Then(/^I am (?:only )?emailed about the comment on "([^"]+)" (#{CAPTURE_EMAIL_COUNT})$/) do |page_title, count|
  expect(unread_emails_for(user_email).select{|email| email.subject =~ Regexp.new(page_title)}.size).to eq count
end

Then(/^"([^"]+)" is emailed about (?:a|the) comment "([^"]+)" by myself on (?:the |a )?page (?:entitled )?"([^"]+)"$/) do |user_name, comment, page_title|
  check_comment_email_content(user_name, comment, current_user, page_title)
end

Then(/^no(?: one|body) else is emailed$/) do
  all_user_emails.each{|em| expect(unread_emails_for(em).count).to eq 0 }
end

Then(/^no(?: one|body) else is emailed about the comment on "([^"]+)"$/) do |page_title|
  all_user_emails.each{|em| expect(unread_emails_for(em).select{|email| email.subject =~ Regexp.new(page_title)}.count).to eq 0 }
end