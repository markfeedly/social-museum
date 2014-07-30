When(/^I (approve|disapprove|remove) a comment on the page entitled "([^"]*)"$/) do |action, comment_content|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    within(".comment-content") do
      click_link("#{action}-comment")
    end
  end
end