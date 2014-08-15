When(/^I delete (?:a|the) collection item called "([^"]+)"$/) do |name|
  visit collection_items_path

  within_role("collection-items") do
    within("[data-role='collection-item'][data-title='#{name}']") do
      click_role('delete-collection-item')
    end
  end
end

Then(/^I can't delete the collection item "([^"]+)"$/) do |name|
  visit collection_items_path

  within_role("collection-items") do
    within("[data-role='collection-item'][data-title='#{name}']") do
      expect(page).not_to have_css("[data-role='delete-collection-item']")
      click_link(name)
    end
  end
  expect(page).not_to have_css("[data-role='delete-collection-item']")
end