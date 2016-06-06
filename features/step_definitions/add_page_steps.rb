def page_count
  Page.count
end

def create_page(title: "Test me #{page_count+1}", content: "test content",
                                                    tags: "", categories: "")
  visit new_page_path
  within_role 'page-form' do
    fill_in('page_title',      :with => title)
    fill_in('page_description',    :with => content)
    fill_in('page_tags_as_str',       :with => tags)
    fill_in('page_categories_as_str', :with => categories)
    click_role('page-item-button')
  end
  Page.last
end

When(/^I (?:have )?created? (a|\d+) pages?$/) do |pages|
  pages = 1 if pages == "a"
  pages.to_i.times.each{ create_page }
end

When(/^I (?:have )?created? a page entitled "([^"]*)"$/) do |title|
  expect(create_page(title: title).subscriptions.count).to eq 1
end

When(/^I create a page with content "([^"]*)"$/) do |content|
  create_page(content: content)
end

When(/^I create a page with tags "([^"]*)"$/) do |tags|
  create_page(tags: tags)
end

When(/^I create a page with categories "([^"]*)"$/) do |categories|
  create_page(categories: categories)
end

When(/^someone else creates a page$/) do
  user_name = current_user
  sign_out
  create_user("somebody")
  sign_in("somebody")

  create_page

  sign_out

  if user_name
    sign_in(user_name)
  end
end