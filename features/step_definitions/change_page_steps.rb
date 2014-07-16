When(/^I change the content to "(.*?)"$/) do |new_content|
  click_link('Edit')
  fill_in('Content', with: new_content)
  click_button 'Update Page'
  # PageState.count.should == 1 # TODO eliminate bad practice db in feature steps file
end

When(/^I change the title to "(.*?)"$/) do |new_title|
  click_link('Edit')
  fill_in('Title', with: new_title)
  click_button 'Update Page'
  # PageState.count.should == 1  # TODO eliminate bad practice db in feature steps file
  end
