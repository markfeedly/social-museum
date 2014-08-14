Before do
  # [0] holds pages, [1] holds collection items
  @resources = Hash.new{|h,k| h[k] = [[],[]]}
end

def resource_count
  @resources.length
end

def create_resource(title: nil, description: "", url: "http://broken.com/img.jpg", for_pages: [], for_collection_items: [], file: nil)
  visit new_resource_path

  title ||= "Test me #{resource_count}"
  within_role 'resource-form' do
    fill_in('resource_title',       :with => title)
    fill_in('resource_description', :with => description)
    fill_in('resource_url',         :with => url)
    if file.present?
      attach_file('file', Rails.root + "features/upload_files/" + file)
    end
    for_pages.each do |page_title|
      check('resource_pages_' + page_title)
      @pages[page_title] << title
    end

    for_collection_items.each do |item_name|
      check('resource_collection-items_' + item_name)
      @pages[item_name] << title
    end

    click_button('Create Resource')
  end
  @resources[title][0] = for_pages
  @resources[title][1] = for_collection_items
end

When(/^I create a new resource entitled "([^"]+)"$/) do |resource_title|
  create_resource(title: resource_title)
end

When(/^I create a new resource entitled "([^"]+)" with a link to "([^"]+)"$/) do |resource_title, resource_url|
  create_resource(title: resource_title, url: resource_url)
end

When(/^I create a new resource with a link to "([^"]+)"$/) do |resource_url|
  create_resource(url: resource_url)
end

When(/^I create a new resource with a description of "(.*?)"$/) do |resource_description|
  create_resource(description: resource_description)
end

When(/^I create a new resource associated with a page entitled "(.*?)"$/) do |page_title|
  create_resource(for_pages: [page_title])
end

When(/^I create a new resource with an upload (\w+(?:\.[a-zA-Z]{2,4}){1,2})$/) do |upload|
  create_resource(file: upload)
end
