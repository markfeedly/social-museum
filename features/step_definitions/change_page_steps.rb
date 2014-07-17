When(/^I change the title to "(.*?)"$/) do |new_title|
  click_link('Edit')

  within_role "page-form" do
    fill_in('Title', with: new_title)
    click_button 'Update Page'
  end
end

When(/^I change the content to "(.*?)"$/) do |new_content|
  click_link('Edit')

  within_role "page-form" do
    fill_in('Content', with: new_content)
    click_button 'Update Page'
  end
end

Then(/^I can see a "(.*?)" error message for "([^"]*)"$/) do |message, attribute|
  within_role "page-form" do
    within_role attribute.downcase do
      within_role "error" do
        page.should have_content(message)
      end
    end
  end
end