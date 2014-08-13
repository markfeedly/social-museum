Then(/^I can see (a|\d+) pages?$/) do |pages|
  visit pages_path
  count = 0
  pages = 1 if pages == "a"

  loop do
    count += page.all("div.search-result").count.to_i
    if page.has_css?("a[rel='next']")
      page.first("a[rel='next']").click
    else
      break
    end
  end
  expect(count).to eq pages.to_i
end

Then(/^I can see a page entitled "([^"]*)"$/) do |title|
  visit pages_path
  expect(page).to have_content(title)
end

Then(/^I can(?:no|')t see a page entitled "([^"]*)"$/) do |title|
  visit pages_path
  expect(page).to_not have_content(title)
end

Then(/^I can see a page with content "([^"]*)"$/) do |content|
  visit pages_path
  expect(page).to have_content(content)
end

Then(/^I can see a page with (tags|categories) "([^"]*)"$/) do |type, content|
  visit pages_path
  within("span[class=#{type}]") do
    expect(page).to have_content(content)
  end
end

Then(/^I can(?:no|')t see the delete page button$/) do
  visit pages_path
  expect(page).to_not have_css("a[data-role='delete-page']")
end

Then(/^I can see page history contains "(.*?)" as (#{CAPTURE_ITEM_RECENCY})$/) do |arg1, index|
  within("#history-tab") do
    within("li[data-history-idx='#{index}']") do
      expect(page).to have_content(arg1)
    end
  end
end

When(/^I visit (?:the |a )(?:first )?page$/) do
  visit pages_path

  page.first("a[class='summary-title']").click
end