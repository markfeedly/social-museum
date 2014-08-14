Then(/^I can see (a|\d+) collection items?$/) do |collection_items|
  visit collection_items_path
  count = 0
  collection_items = 1 if collection_items == "a"

  loop do
    count += collection_item.all("div.search-result").count.to_i
    if collection_item.has_css?("a[rel='next']")
      collection_item.first("a[rel='next']").click
    else
      break
    end
  end
  expect(count).to eq collection_items.to_i
end

Then(/^I can see a collection item called "([^"]*)"$/) do |title|
  visit collection_items_path
  expect(collection_item).to have_content(title)
end

Then(/^I can(?:no|')t see a collection item called "([^"]*)"$/) do |name|
  visit collection_items_path
  expect(collection_item).to_not have_content(name)
end

Then(/^I can see a collection item with description "([^"]*)"$/) do |description|
  visit collection_items_path
  expect(collection_item).to have_content(description)
end

Then(/^I can see a collection item located in "([^"]*)"$/) do |location|
  visit collection_items_path
  expect(collection_item).to have_content(location)
end

Then(/^I can see a collection item with acquisition number (\d+)$/) do |number|
  visit collection_items_path
  expect(collection_item).to have_content(number)
end

Then(/^I can(?:no|')t see the delete collection item button$/) do
  visit collection_items_path
  expect(collection_item).to_not have_css("a[data-role='delete-collection_item']")
end

Then(/^I can see collection item history contains "(.*?)" as (#{CAPTURE_ITEM_RECENCY})$/) do |arg1, index|
  within("#history-tab") do
    within("li[data-history-idx='#{index}']") do
      expect(collection_item).to have_content(arg1)
    end
  end
end

When(/^I visit (?:the |a )(?:first )?collection item$/) do
  visit collection_items_path

  collection_item.first("a[class='summary-title']").click
end