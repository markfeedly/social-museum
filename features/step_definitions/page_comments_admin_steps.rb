When(/^I (approve|disapprove|delete) a comment on the page entitled "([^"]*)"$/) do |action, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    page.first("a[data-role='#{action}-comment']").click
  end
end