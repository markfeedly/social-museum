# TODO Replace with non-hacky and readable version
When(/^I change the (.*) to "(.*?)"$/) do |target, new_value|

  target.gsub!('collection item', 'collection-item')
  obj, attribute = target.downcase.split(' ', 2)
  attribute.gsub!(' ', '-')
  click_link('Edit')

  within_role "#{obj}-form" do
    fill_in("#{obj}_#{attribute}", with: new_value)
    click_button 'Update'
  end
end