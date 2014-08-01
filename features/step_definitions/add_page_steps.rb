Before do
  @pages = Hash.new{|h,k| h[k] = []}
end

def page_count
  @pages.length
end

def create_page(title: nil, content: "test content", tags: "")
  visit new_page_path

  title ||= "Test me #{page_count}"
  within_role 'page-form' do
    fill_in('Title', :with => title)
    fill_in('Content', :with => content)
    fill_in('Tags', :with => tags)
    click_button('Create Page')
  end
  # TODO Change empty array to resource_title (or unique identifier)
  @pages[title] = []
end

When(/^I create (a|\d+) pages?$/) do |pages|
  pages = 1 if pages == "a"
  pages.to_i.times.each{ create_page }
end

When(/^I create a page entitled "([^"]*)"$/) do |title|
  create_page(title: title)
end

When(/^I create a page with content "([^"]*)"$/) do |content|
  create_page(content: content)
end

When(/^I create a page with tags "([^"]*)"$/) do |tags|
  create_page(title: title, tags: tags)
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