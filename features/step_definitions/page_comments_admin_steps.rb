When(/^I (approve|disapprove|remove) a comment on the page entitled "([^"]*)"$/) do |action, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    if page.has_css?("a[class='#{action}-comment']")
      page.first("a[class='#{action}-comment']").click
    end
  end
end