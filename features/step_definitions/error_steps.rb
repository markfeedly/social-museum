Then(/^I can see a "(.*?)" error for the (.*)$/) do |message, target|
  obj, attribute = target.downcase.split(' ', 2)
  attribute.gsub!(' ', '-')
  within_role "#{obj.downcase}-form" do
    within_role attribute.downcase do
      within_role "error" do
        page.should have_content(message)
      end
    end
  end
end