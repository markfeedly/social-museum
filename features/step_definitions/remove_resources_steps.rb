=begin
# For if slugs are implemented
When(/^I remove a resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path
  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    click_link('Remove resource')
  end
end
=end

When(/^I remove a resource with title "(.*?)"$/) do |resource_title|
  visit resources_path
  within("[data-resource-title='#{resource_title}']") do
    click_link('Remove resource')
  end
end