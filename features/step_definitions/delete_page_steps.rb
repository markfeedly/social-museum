When(/^I delete a page entitled "(.*?)"$/) do |title|
  visit pages_path

  within("[data-page-slug='#{Page.find_by_title(title).slug}']") do
    page.first("a[data-role='delete-page']").click
  end
end