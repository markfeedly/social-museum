# TODO Replace with non-hacky and readable version
When(/^I change the (.*) to "(.*?)"$/) do |target, new_value|

  target.gsub!('collection item', 'collection_item')
  obj, attribute = target.downcase.split(' ', 2)
  attribute.gsub!(' ', '_')
  click_link('Edit')

  if obj=='collection_item' && attribute=='name'
    fill_in('page_title', with: new_value)
  else
    within_role "#{obj}-form" do
    fill_in("#{obj}_#{attribute}", with: new_value)
    end
  end

  click_button 'Update'

  end