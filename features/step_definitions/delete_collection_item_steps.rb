When(/^I delete (?:||the) collection item called "([^"]+)"$/) do |name|
  visit collection_items_path

  within("[data-collection-item-slug='#{CollectionItem.find_by_name(name).slug}']") do
    click_role('delete-collection-item')
  end
end