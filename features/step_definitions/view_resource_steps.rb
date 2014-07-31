def visit_resource(resource_title: nil, page_title: nil)
  visit resources_path
  resource_title  ||= @resources.find{|_, v| v.include? page_title}.try(:first)
  within("[data-resource-title='#{resource_title}']") do
    click_link(resource_title)
  end
end

Then(/^I can see a resource entitled "(.*?)"$/) do |page_title|
  page.should have_content(page_title)
end

Then(/^I cannot see a resource entitled "(.*?)"$/) do |page_title|
  page.should_not have_content(page_title)
end

Then(/^I can see a resource with a link to "(.*?)"$/) do |resource_url|
  visit resources_path
  page.should have_css("img[src='#{resource_url}']")
end

Then(/^I can see a resource associated with a page entitled "(.*?)"$/) do |page_title|
  visit_resource(page_title: page_title)
  click_link(page_title)
end

Then(/^I can see a resource with description "(.*?)"$/) do |resource_description|
  visit resources_path
  # TODO Use a less generic way to find the description
  within(".search-result") do
    first('a').click
  end

  page.should have_content(resource_description)
end

Then(/^I cannot see an image resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path

  page.should_not have_css("[data-resource-title='#{resource_title}']")
end

Then(/^I cannot remove a resource with title "(.*?)"$/) do |resource_title|
  visit resources_path
  within("[data-resource-title='#{resource_title}']") do
    page.should_not have_link('Remove resource')
  end
end

When(/I go to a resource entitled "([^"]+)"/) do |resource_title|
  visit_resource(resource_title: resource_title)
end