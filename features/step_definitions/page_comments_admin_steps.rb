When(/^I (approve|disapprove|delete) (?:a|the) comment on the page entitled "([^"]*)"$/) do |action, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    page.first("a[data-role='#{action}-comment']").click
  end
end

When(/^The comment on the page entitled "([^"]*)" is (approved|disapproved|deleted)$/) do |page_title, action|
  as_admin do
    visit page_path(Page.find_by_title(page_title))

    within("#comments") do
      page.first("a[data-role='#{action.gsub(/d$/,'')}-comment']").click
    end
  end
end