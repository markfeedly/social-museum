require 'spec_helper'

describe 'CollectionItem Categories' do

  def new_collection_item(cat_str = '')
    ci = FactoryGirl.create(:collection_item, user_id: user.id)
    ci.set_categories_from_string(cat_str) unless cat_str.empty?
    ci
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:collection_item) { new_collection_item }
  let(:all_triples) { [['Manchester computer', :isa, 'Computer'],
                       ['Ferranti Mark I', :isa, 'Manchester computer'],
                       ['MU5', :isa, 'Manchester computer'],
                       ['MU6G', :isa, 'Manchester computer'],
                       ['SSEM', :isa, 'Manchester computer'],
                       ['Atlas', :isa, 'Manchester computer'],
                       ['VUM Atlas', :isa, 'Atlas'],
                       ['Other computer', :isa, 'Computer'],
                       ['PDP-11', :isa, 'Other computer']] }

  it "should get categories" do
    expect(collection_item.get_categories).to eq all_triples
    expect(Category.get_categories).to        eq all_triples
  end

  it "should match triples" do
    expect(Category.get_matches(nil,  nil,  nil) ).to eq all_triples
    expect(Category.get_matches(nil,  nil,  'Manchester computer')).to eq [['Ferranti Mark I', :isa, 'Manchester computer'], ['MU5', :isa, 'Manchester computer'], ['MU6G', :isa, 'Manchester computer'], ['SSEM', :isa, 'Manchester computer'], ['Atlas', :isa, 'Manchester computer']]
    expect(Category.get_matches(nil,  :isa, nil)).to eq all_triples
    expect(Category.get_matches(nil,  :isa, 'Manchester computer')).to eq [['Ferranti Mark I', :isa, 'Manchester computer'], ['MU5', :isa, 'Manchester computer'], ['MU6G', :isa, 'Manchester computer'], ['SSEM', :isa, 'Manchester computer'], ['Atlas', :isa, 'Manchester computer']]

    expect(Category.get_matches('MU5', nil, nil)).to eq [['MU5', :isa, 'Manchester computer']]
    expect(Category.get_matches('MU5', nil, 'Manchester computer')).to eq [['MU5', :isa, 'Manchester computer']]
    expect(Category.get_matches('MU5', :isa, nil)).to eq [['MU5', :isa, 'Manchester computer']]
    expect(Category.get_matches('MU5', :isa, 'Manchester computer')).to eq [['MU5', :isa, 'Manchester computer']]
  end

  it "should find children" do
    expect(Category.get_children(:isa, 'Other computer')).to eq ['Other computer', 'PDP-11']
    expect(Category.get_children(:isa, 'Atlas')).to eq ['Atlas', 'VUM Atlas']
    expect(Category.get_children(:isa, 'VUM Atlas')).to eq ['VUM Atlas']
    expect(Category.get_children(:isa, 'Manchester computer')).to eq ['Atlas', 'Ferranti Mark I', 'MU5', 'MU6G', 'Manchester computer', 'SSEM', 'VUM Atlas']
  end

  it "should find collection items" do
    new_collection_item('Atlas')
    ci = Category.find_categorized('Atlas')
    expect(ci.count).to eq 1
    expect(ci.first.has_category?('Atlas')).to eq true
    new_collection_item('Atlas')
    new_collection_item('a second spurious')
    ci = Category.find_categorized('Atlas')
    expect(ci.count).to eq 2
    expect(ci.first.has_category?('Atlas') && ci.last.has_category?('Atlas')).to eq true
  end

  it "should find child collection items" do
    new_collection_item('VUM Atlas')
    collection_items = Category.find_categorized_including_child_categories('Atlas')
    expect(collection_items.count).to eq 1
    expect(collection_items.first.has_category?('Atlas')).to eq false
    expect(collection_items.first.has_category?('VUM Atlas')).to eq true
    new_collection_item('Atlas')
    new_collection_item('a second spurious')
    collection_items = Category.find_categorized_including_child_categories('Atlas')
    expect(collection_items.count).to eq 2
    expect(collection_items.first.has_category?('Atlas') && collection_items.last.has_category?('VUM Atlas')).to eq false
    expect(collection_items.first.has_category?('VUM Atlas') && collection_items.last.has_category?('Atlas')).to eq true
    collection_items = Category.find_categorized_including_child_categories('Manchester computer')
    expect(collection_items.count).to eq 2
    expect(collection_items.first.has_category?('VUM Atlas') && collection_items.last.has_category?('Atlas')).to eq true
  end

end
