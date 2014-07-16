When(/^I create a page entitled "(.*?)" with content "(.*?)"$/) do |title, content|
  click_link('add_page_link')

  fill_in('Title', :with => title)
  fill_in('Content', :with => content)
  click_button('Create Page')
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

When(/^I create a tagged page entitled "(.*?)" with content "(.*?)" and tags (.*?)$/) do |title, content, tags|
  click_link('add_page_link')

  fill_in('Title',   :with => title)
  fill_in('Content', :with => content)
  fill_in('Tags',    :with => tags)

  click_button('Create Page')
end

When(/^I navigate to the 'Pages' page$/) do
  click_link 'Pages'
end






