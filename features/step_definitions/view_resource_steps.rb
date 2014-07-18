=begin
Then(/^I can see an image resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path

  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    page.should have_content(resource_title)
    page.should have_css("img[src='#{resource_url}']")
  end
end

Then(/^I can see a resource entitled "(.*?)", and a link to "(.*?)", associated with page "(.*?)"$/) do |resource_title, resource_url, page_title |
  visit resources_path

  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    page.should have_link(page_title, :href => page_path(Page.find_by_title(page_title)))
  end
end

Then(/^I can see a resource entitled "(.*?)" with description "(.*?)"$/) do |resource_title, resource_description |
  visit resources_path

  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    page.should have_content(resource_title)
    page.should have_content(resource_description)
  end
end

Then(/^I cannot see an image resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path

  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    page.should have_content(resource_title)
    page.should_not have_css("img[src='#{resource_url}']")
  end
end
=end

Then(/^I can see an image resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path

  within("[data-resource-title='#{resource_title}']") do
    page.should have_content(resource_title)
    page.should have_css("img[src='#{resource_url}']")
  end
end

Then(/^I can see a resource entitled "(.*?)", and a link to "(.*?)", associated with page "(.*?)"$/) do |resource_title, resource_url, page_title |
  visit resources_path

  within("[data-resource-title='#{resource_title}']") do
    click_link(resource_title)
  end

  page.should have_link(page_title, :href => page_path(Page.find_by_title(page_title)))
end

Then(/^I can see a resource entitled "(.*?)" with description "(.*?)"$/) do |resource_title, resource_description |
  visit resources_path

  within("[data-resource-title='#{resource_title}']") do
    click_link(resource_title)
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