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