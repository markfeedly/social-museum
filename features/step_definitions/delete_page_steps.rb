When(/^I delete (?:a|the) page entitled "(.*?)"$/) do |title|
  visit pages_path

  within("[data-page-slug='#{Page.find_by_title(title).slug}']") do
    click_role('delete-page')
  end
end