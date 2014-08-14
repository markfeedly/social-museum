Before do
  @pages = Hash.new{|h,k| h[k] = []}
end

def page_count
  @pages.length
end

def create_page(title: nil, content: "test content", tags: "", categories: "")
  visit new_page_path

  title ||= "Test me #{page_count}"
  within_role 'page-form' do
    fill_in('page[page_title_attributes][title]',      :with => title)
    fill_in('page_content',    :with => content)
    fill_in('page_tags',       :with => tags)
    fill_in('page_categories', :with => categories)
    click_role('create-page-button')
  end
  @pages[title] = []
end

When(/^I (?:have )?created? (a|\d+) pages?$/) do |pages|
  pages = 1 if pages == "a"
  pages.to_i.times.each{ create_page }
end

When(/^I (?:have )?created? a page entitled "([^"]*)"$/) do |title|
  create_page(title: title)
end

When(/^I create a page with content "([^"]*)"$/) do |content|
  create_page(content: content)
end

When(/^I create a page with tags "([^"]*)"$/) do |tags|
  create_page(title: title, tags: tags)
end

When(/^I create a page with categories "([^"]*)"$/) do |categories|
  create_page(title: title, categories: categories)
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