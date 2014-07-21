Before do
  @pages = []
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
  @pages << title
end



When(/^I create (a|\d+) pages?$/) do |pages|
  if pages == "a"
    create_page()
  else
    (1..pages.to_i).each do
      create_page
    end
  end
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