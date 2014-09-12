Before do
  @collection_items = Hash.new{|h,k| h[k] = []}
end

def collection_item_count
  @collection_items.length
end

def create_collection_item(name: nil, description: '', location: 'kilburn', acquisition_number: '001')
  visit new_collection_item_path

  name ||= "Item #{collection_item_count}"
  within_role 'collection_item-form' do
    fill_in('collection_item[title_attributes][title]',        :with => name)
    fill_in('collection_item_description', :with => description)
    fill_in('collection_item_location',    :with => location)
    fill_in('collection_item_acquisition_number',      :with => acquisition_number)
    click_role('create-collection-item-button')
  end
  @collection_items[name] = []
end

When(/^I (?:have )?created? (a|\d+) collection items?$/) do |collection_items|
  collection_items = 1 if collection_items == "a"
  collection_items.to_i.times {|i| create_collection_item acquisition_number: "00#{i}" }
end

When(/^I (?:have )?created? a collection item called "([^"]*)"$/) do |name|
  create_collection_item(name: name)
end

When(/^I (?:have )?created? a collection item with description "([^"]*)"$/) do |description|
  create_collection_item(description: description)
end

When(/^I (?:have )?created? a collection item located in "([^"]*)"$/) do |location|
  create_collection_item(location: location)
end

When(/^I (?:have )?created? a collection item with acquisition number (\d+)$/) do |number|
  create_collection_item(acquisition_number: number)
end

When(/^someone else creates a collection item$/) do
  user_name = current_user
  sign_out
  create_user("somebody")
  sign_in("somebody")

  create_collection_item

  sign_out

  if user_name
    sign_in(user_name)
  end
end

When(/^An admin has created a collection item$/) do
  as_admin { create_collection_item }
end

When(/^An admin has created a collection item called "([^"]*)"$/) do |name|
  as_admin { create_collection_item(name: name) }
end