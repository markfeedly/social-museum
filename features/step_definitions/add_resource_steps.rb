When(/^I create a new resource with title "(.*?)" and link to "(.*?)"$/) do |resource_title, resource_url|
  visit new_resource_path

  within_role("resource-form") do
    fill_in('resource_title', :with => resource_title)
    fill_in('resource_url', :with => resource_url)
    click_button('Create Resource')
  end
end

When(/^I create a new resource with title "(.*?)", and a link to "(.*?)", associated with page "(.*?)"$/) do |resource_title, resource_url, page_title|
  visit new_resource_path

  within_role("resource-form") do
    fill_in('resource_title', :with => resource_title)
    fill_in('resource_url', :with => resource_url)
    check('resource_pages_' + page_title)
    click_button('Create Resource')
  end
end

When(/^I create a new resource with title "(.*?)", and a description of "(.*?)"$/) do |resource_title, resource_description|
  resource_url = "http://media.npr.org/images/picture-show-flickr-promo.jpg"

  visit new_resource_path

  within_role("resource-form") do
    fill_in('resource_title', :with => resource_title)
    fill_in('resource_url', :with => resource_url)
    fill_in('resource_description', :with => resource_description)
    click_button('Create Resource')
  end
end