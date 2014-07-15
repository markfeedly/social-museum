Given(/^"(.*?)" exists as a user$/) do |user_name|
  create_user(user_name)
end

Given(/^"(.*?)" is signed in$/) do |user_name|
  sign_in(user_name)
end

And(/^"(.*?)" is signed out$/) do |arg1|
  sign_out
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
  open_last_email_for(user_email)

  expect( current_email.to_addrs).to eq [ user_email ]
  expect( current_email.default_part_body.to_s).to include(page_title)
  expect( current_email.default_part_body.to_s).to include(comment)
  pg = Page.find_by_title(page_title)
  expect(current_email.default_part_body.to_s).to include(page_path pg)
end

Then(/^"(.*?)" is emailed about a comment "(.*?)" on page entitled "(.*?)"$/) do |user_name, comment, page_title|
  unread_emails_for(user_email(user_name)).count.should == 1
  open_last_email_for(user_email(user_name))

  expect( current_email.to_addrs).to eq [ user_email(user_name) ]
  expect( current_email.default_part_body.to_s).to include(page_title)
  expect( current_email.default_part_body.to_s).to include(comment)
  pg = Page.find_by_title(page_title)
  expect(current_email.default_part_body.to_s).to include(page_path pg)
end

And(/^no one else is emailed$/) do
  all_user_emails.each{|em| unread_emails_for(em).count.should == 0 }
end

When(/^"(.*?)" signs in and adds a comment "(.*?)" to the page entitled "(.*?)"$/) do |user_name, comment, page_title|
  sign_out
  create_user(user_name) unless user_exists?(user_name)
  sign_in(user_name)
  visit "/pages/#{Page.find_by_title(page_title).slug}"
  click_on 'Add a comment'
  fill_in 'comment[content]', with: comment
  click_on 'Add comment'
end

Given(/^I unsubscribe from page entitled "(.*?)" via the emailed unsubscribe link$/) do |page_title|
  click_email_link_matching 'Unsubscribe'
end

Given(/^I unsubscribe from page entitled "(.*?)" via the page button$/) do |page_title|
  visit page_path(Page.find_by_title(page_title))
  body.should match page_title
  click_on 'Unsubscribe'
end