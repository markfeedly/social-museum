When(/^I create a page entitled "(.*?)" with content "(.*?)"$/) do |title, content|
  click_link('add_page_link')

  fill_in('Title', :with => title)
  fill_in('Content', :with => content)
  click_button('Create Page')
end

When(/^I create a tagged page entitled "(.*?)" with content "(.*?)" and tags (.*?)$/) do |title, content, tags|
  click_link('add_page_link')

  fill_in('Title',   :with => title)
  fill_in('Content', :with => content)
  fill_in('Tags',    :with => tags)
  click_button('Create Page')
end