When(/^I remove a resource with title "(.*?)", and a link to "(.*?)"$/) do |resource_title, resource_url|
  visit resources_path
  within("[data-resource-slug='#{Resource.find_by_title(title).slug}']") do
    click_link('Remove resource')
  end
end