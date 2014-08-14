Then(/^I can see an? "([^"]+)" error for the ([^"]+)$/) do |message, target|
  target.gsub!('collection item', 'collection-item')
  obj, attribute = target.downcase.split(' ', 2)
  attribute.gsub!(' ', '-')
  within_role "#{obj.downcase}-form" do
    within_role attribute.downcase do
      within_role "error" do
        expect(page).to have_content(message)
      end
    end
  end
end