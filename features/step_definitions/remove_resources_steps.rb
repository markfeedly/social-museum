When(/^I remove a resource with title "(.*?)"$/) do |resource_title|
  visit resources_path
  within("[data-resource-title='#{resource_title}']") do
    click_link('Remove resource')
  end
end