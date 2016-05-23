require 'spec_helper'

describe 'CollectionItem' do

  def create_collection_item(item_num)
    c = CollectionItem.new
    c.title = Title.create!(title: "Collection item #{item_num}")
    c.item_number = item_num
    c.location = 'LF.23'
    c.set_categories_from_string( 'cat2, cat1' )
    c.logged_user_id = 1
    c.save!
  end

  let(:collection_item){
    CollectionItem.delete_all
    create_collection_item(1)
    CollectionItem.first
  }

  it 'basic' do
    collection_item
    expect(CollectionItem.count).to eq 1
    expect(Category.count).to eq 2
    expect(CategoryItem.count).to eq 2
    expect(collection_item.categories_as_arr).to eq %w{cat1 cat2}
    expect(collection_item.categories_as_str).to eq 'cat1, cat2'

    collection_item.set_categories_from_string( 'cat2, cat1, cat3' )
    expect(collection_item.categories_as_str).to eq 'cat1, cat2, cat3'
    expect(Category.count).to eq 3
    expect(CategoryItem.count).to eq 3

    collection_item.set_categories_from_string( 'cat4' )
    expect(collection_item.categories_as_str).to eq 'cat4'
    expect(Category.count).to eq 4
    expect(CategoryItem.count).to eq 1

    collection_item.set_categories_from_string( '' )
    expect(collection_item.categories_as_str).to eq ''
    expect(Category.count).to eq 4
    expect(CategoryItem.count).to eq 0
  end

  it 'should delete category items and preserve categories on deleting a collection item' do
    collection_item.destroy
    expect(CollectionItem.count).to eq 0
    expect(Category.count).to eq 2
    expect(CategoryItem.count).to eq 0
  end

  it 'should return category arrays' do
    expect(collection_item.categories_as_arr).to eq %w{cat1 cat2}
    collection_item.set_categories_from_string( '' )
    expect(collection_item.categories_as_arr).to eq []
  end

  it 'should return category strings' do
    expect(collection_item.categories_as_str).to eq 'cat1, cat2'
    collection_item.set_categories_from_string( '' )
    expect(collection_item.categories_as_str).to eq ''
  end

  def get_collection_items(cat)
    Category.where(name: cat).first.all_categorised
  end

  def expect_category_count(cat, cnt)
    expect(Category.where(name: cat).length).to eq cnt
  end

  it 'should deal with the repeated use of the same category' do
    collection_item
    expect_category_count('cat1', 1)
    create_collection_item(2)
    expect_category_count('cat1', 1)
    cat = Category.where(name: 'cat1').first
    cat_id = cat.id
    expect(CategoryItem.where(category_id: cat_id).length).to eq 2
  end

  it 'should destroy a CollectionItem and its CategoryItems ' do
    collection_item
    create_collection_item(2)
    expect(CategoryItem.count).to eq 4
    CollectionItem.first.destroy
    expect_category_count('cat1', 1)
    expect(CategoryItem.count).to eq 2
  end

  it 'should destroy a Category and its CategoryItems ' do
    collection_item
    create_collection_item(2)
    expect(CollectionItem.count).to eq 2
    expect(CategoryItem.count).to eq 4
    expect(Category.count).to eq 2
    Category.where(name: 'cat1').first.destroy
    expect(CollectionItem.count).to eq 2
    expect(CategoryItem.count).to eq 2
    expect(Category.count).to eq 1
  end


  it 'should get the right trail' do
    expect(collection_item.category_trail('VUM Atlas', :isa)).to eq ['VUM Atlas', 'Atlas', 'Computer']
  end

  it 'should find the inverse set' do
    expect(collection_item.category_inverse_set('VUM Atlas', :isa)).to eq(['VUM Atlas'])
    expect(collection_item.category_inverse_set('Atlas', :isa)).to eq(['Atlas', 'VUM Atlas'])
    expect(collection_item.category_inverse_set('Computer', :isa)).to eq(["Atlas", "Computer", "Ferranti Mark I", "MU5", "VUM Atlas"])
  end

  it 'should find collection items in the inverse set', :broken => true do
    pending("todo/getting finished")
    collection_item.set_categories_from_string( 'VUM Atlas' )
    expect(collection_item.categorised_in_inverse_set?('VUM Atlas', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('Atlas', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('Computer', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('MU6G', :isa)).to eq false
    collection_item.set_categories_from_string('not in table, MU6G')
    expect(collection_item.categorised_in_inverse_set?('MU6G', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('Atlas', :isa)).to eq false
    collection_item.set_categories_from_string('not in table')
    expect(collection_item.categorised_in_inverse_set?('Atlas', :isa)).to eq false
  end

end