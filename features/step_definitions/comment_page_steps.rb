When(/^I make the comment "(.*?)" on the page entitled "(.*?)"$/) do |page_comment, page_title|
  visit page_path(Page.find_by_title(page_title))

  within("#comments") do
    within("#comment-button") do
      click_link("Add a comment")
    end

    within("#comment-form") do
      fill_in("comment_content", with: page_comment)
      click_button("Add comment")
    end
  end
end