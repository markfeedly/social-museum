Then(/^I can see (a|\d+) collection items?$/) do |collection_items|
  visit collection_items_path
  count = 0
  collection_items = 1 if collection_items == "a"

  loop do
    count += page.all(".search-result").count.to_i
    if page.has_css?("a[rel='next']")
      page.first("a[rel='next']").click
    else
      break
    end
  end
  expect(count).to eq collection_items.to_i
end

Then(/^I can see (?:a|the) collection item called "([^"]*)"$/) do |title|
  visit collection_items_path
  expect(page).to have_content(title)
end

Then(/^I can(?:no|')t see (?:a|the) collection item called "([^"]*)"$/) do |name|
  visit collection_items_path
  expect(page).to_not have_content(name)
end

Then(/^I can see (?:a|the) collection item with description "([^"]*)"$/) do |description|
  expect(page).to have_content(description)
end

Then(/^I can see (?:a|the) collection item located in "([^"]*)"$/) do |location|
  expect(page).to have_content(location)
end

Then(/^I can see (?:a|the) collection item with acquisition number (\d+)$/) do |number|
  expect(page).to have_content(number)
end

Then(/^I can(?:no|')t see (?:a|the) delete collection item button$/) do
  expect(page).to_not have_css("a[data-role='delete-collection-item']")
end

Then(/^I can see collection item history contains "(.*?)" as (#{CAPTURE_ITEM_RECENCY})$/) do |arg1, index|
  within("li[data-history-idx='#{index}']") do
    expect(page).to have_content(arg1)
  end
end

When(/^I visit (?:the|a) (?:first )?collection item$/) do
  visit collection_items_path

  page.first("a[class='summary-title']").click
end