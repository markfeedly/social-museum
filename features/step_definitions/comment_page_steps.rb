When(/^(?:I|another user) makes? the comment "(.*?)" on the page entitled "(.*?)"$/) do |page_comment, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    click_role('show-comment-form')

    within("#comment-form") do
      fill_in('comment_content', with: page_comment)
      click_role('add-comment')
    end
  end
end

When(/^a spammer makes? the comment "(.*?)" on the page entitled "(.*?)"$/) do |page_comment, page_title|
  user_name = current_user
  sign_out
  create_user('viagra-test-123')
  sign_in('viagra-test-123')

  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    click_role('show-comment-form')

    within("#comment-form") do
      fill_in("comment_content", with: page_comment)
      click_role('add-comment')
    end
  end

  sign_out

  if user_name
    sign_in(user_name)
  end
end

Then(/^I can see a comment "(.*?)" as (#{CAPTURE_ITEM_RECENCY}) comment on the page entitled "(.*?)"$/) do |comment_content, index, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    within("li[data-comment-idx='#{index}']") do
      page.should have_content(comment_content)
    end
  end
end

Then(/^I can see a (?:comment|message) "(.*?)" on the page entitled "(.*?)"$/) do |content, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    page.should have_content(content)
  end
end

Then(/^I can(?:no|')t see a (?:comment|message) "(.*?)" on the page entitled "(.*?)"$/) do |content, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    page.should_not have_content(content)
  end
end
