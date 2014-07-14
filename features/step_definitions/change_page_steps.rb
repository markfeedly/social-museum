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

Then(/^I can see one item of page history containing "(.*?)" as most recent$/) do |arg1|
  within('#history-tab') do
    within('li[data-history-idx="0"]') do
      page.should have_content(arg1)
    end
  end
end

Then(/^I can see one item of page history containing "(.*?)" as second most recent$/) do |arg1|
  within('#history-tab') do
    within('li[data-history-idx="1"]') do
      page.should have_content(arg1)
    end
  end
end

Then(/^I can see one item of page history containing "(.*?)" as third most recent$/) do |arg1|
  within('#history-tab') do
      within('li[data-history-idx="2"]') do
        page.should have_content(arg1)
      end
  end
end
