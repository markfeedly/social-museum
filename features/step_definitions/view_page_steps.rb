When(/^I navigate to the 'Pages' page$/) do
  click_link 'Pages'
end

Then(/^I can see a page entitled "(.*?)" with content "(.*?)"$/) do |title, content|
  visit pages_path
  page.should have_content(title)
  page.should have_content(content)
end

Then(/^I can't see a page entitled "(.*?)" with content "(.*?)"$/) do |title, content|
  visit pages_path
  page.should_not have_content(title)
  page.should_not have_content(content)
end

Then(/^I can see a tagged page entitled "(.*?)" with content "(.*?)" and tags "(.*?)"$/) do |title, content, tags|
  page.should have_content(title)
  page.should have_content(content)
  page.should have_content(tags)
end

Then(/^I see the navigation menu$/) do
  within('.nav') do
    page.should have_content('New Page')
    page.should have_content('Pages')
    page.should have_content('New Resource')
    page.should have_content('Resource')
    page.should have_content('Profile')
  end
end

Then(/^I cannot see the remove page link$/) do
  visit pages_path
  page.should_not have_css("[delete-page]")
end

Then(/^I can see a page with title "(.*?)"$/) do |title|
  page.should have_content(title)
end

CAPTURE_ITEM_RECENCY = Transform /^(|second|third) ?most recent$/ do |position|
  index = 0 if position == ""
  index = 1 if position == "second"
  index = 2 if position == "third"
  index
end

Then(/^I can see one item of page history containing "(.*?)" as (#{CAPTURE_ITEM_RECENCY})$/) do |arg1, index|
  within('#history-tab') do
    within("li[data-history-idx='#{index}']") do
      page.should have_content(arg1)
    end
  end
end

Then(/^I can see a comment "(.*?)" as (#{CAPTURE_ITEM_RECENCY}) comment on the page entitled "(.*?)"$/) do |comment_content, index, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("li[data-comment-idx='#{index}']") do
    within(".comment-content") do
      page.should have_content(comment_content)
    end
  end
end