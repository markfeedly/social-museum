Then(/^I can see an image resource with title "(.*?)" and link of "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path

  page.should have_content(resource_title)
  page.should have_css("img[src='#{resource_url}']")
end

Then(/^I can see a resource with title "(.*?)" and a link of "(.*?)", associated with page "(.*?)"$/) do |resource_title, resource_url, page_title |
  page.should have_link(page_title, :href => page_path(Page.find_by_title(page_title)))
end