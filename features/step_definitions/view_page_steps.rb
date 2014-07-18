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

Then(/^I can see one item of page history containing "(.*?)" as most recent$/) do |arg1|
  within('#history-tab') do
    within('li[data-history-idx="0"]') do
      page.should have_content(arg1)
    end
  end
end

Then(/^I can see one item of page history containing "(.*?)" as second most recent$/) do |arg1|
  within('#history-tab') do
    within('li[data-history-idx="1"]') do
      page.should have_content(arg1)
    end
  end
end

Then(/^I can see one item of page history containing "(.*?)" as third most recent$/) do |arg1|
  within('#history-tab') do
    within('li[data-history-idx="2"]') do
      page.should have_content(arg1)
    end
  end
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

Then(/^I can see a comment "(.*?)" as the most recent comment on the page entitled "(.*?)"$/) do |comment_content, page_title|
  visit page_path(Page.find_by_title(page_title))

  within('li[data-comment-idx="0"]') do
    within(".comment-content") do
      page.should have_content(comment_content)
    end
  end
end

Then(/^I can see a comment "(.*?)" as the second most recent comment on the page entitled "(.*?)"$/) do |comment_content, page_title|
  visit page_path(Page.find_by_title(page_title))

  within('li[data-comment-idx="1"]') do
    within(".comment-content") do
      page.should have_content(comment_content)
    end
  end
end