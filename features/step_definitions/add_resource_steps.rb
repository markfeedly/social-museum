Before do
  @resources = Hash.new{|h,k| h[k] = []}
end

def resource_count
  @resources.length
end

def create_resource(title: nil, description: "", url: "http://broken.com/img.jpg", for_pages: [])
  visit new_resource_path

  title ||= "Test me #{resource_count}"
  within_role 'resource-form' do
    fill_in('resource_title', :with => title)
    fill_in('resource_description', :with => description)
    fill_in('resource_url', :with => url)

    for_pages.each do |page_title|
      check('resource_pages_' + page_title)
      @pages[page_title] << title
    end

    click_button('Create Resource')
  end
  @resources[title] = for_pages
end

When(/^I create a new resource entitled "(.*?)"$/) do |resource_title|
  create_resource(title: resource_title)
end

When(/^I create a new resource with a link to "(.*?)"$/) do |resource_url|
  create_resource(url: resource_url)
end

When(/^I create a new resource with a description of "(.*?)"$/) do |resource_description|
  create_resource(description: resource_description)
end

When(/^I create a new resource associated with a page entitled "(.*?)"$/) do |page_title|
  create_resource(for_pages: [page_title])
end