When(/^I (approve|disapprove|delete) (?:a|the) comment on the page entitled "([^"]*)"$/) do |action, page_title|
  visit pages_path
  page.first(:css, 'a', text: page_title).click

  within("#comments") do
    page.first("a[data-role='#{action}-comment']").click
  end
end

When(/^The comment on the page entitled "([^"]*)" is (approved|disapproved|deleted)$/) do |page_title, action|
  as_admin do
    visit pages_path
    page.first(:css, 'a', text: page_title).click

    within("#comments") do
      page.first("a[data-role='#{action.gsub(/d$/,'')}-comment']").click
    end
  end
end