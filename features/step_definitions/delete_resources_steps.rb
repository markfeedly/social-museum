When(/^I delete a resource with title "(.*?)"$/) do |resource_title|
  visit resources_path

  within("[data-resource-title='#{resource_title}']") do
    page.first("a[data-role='delete-resource']").click
  end
end