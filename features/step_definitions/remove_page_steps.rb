When(/^I remove a page entitled "(.*?)"$/) do |title|
  visit pages_path
  within("[data-page-slug='#{Page.find_by_title(title).slug}']") do
    click_link('Remove page')
  end
end