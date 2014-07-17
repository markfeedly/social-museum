When(/^I create a new resource with title "(.*?)" and link of "(.*?)"$/) do |resource_title, resource_url|
  visit new_resource_path

  fill_in('resource_title', :with => resource_title)
  fill_in('resource_url', :with => resource_url)
  click_button('Create Resource')
end

When(/^I create a new resource with title "(.*?)" and a link of "(.*?)", associated with page "(.*?)"$/) do |resource_title, resource_url, page_title|
  visit new_resource_path

  fill_in('resource_title', :with => resource_title)
  fill_in('resource_url', :with => resource_url)
  check('resource_pages_' + page_title)
  click_button('Create Resource')
end