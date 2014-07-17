When(/^I remove a page entitled "(.*?)" with content "(.*?)"$/) do |title, content|
  visit pages_path
  within("[data-page-slug='#{Page.find_by_title(title).slug}']") do
    click_link('Remove page')
  end
end