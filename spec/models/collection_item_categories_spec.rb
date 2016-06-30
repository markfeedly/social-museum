require 'spec_helper'

describe 'CollectionItem Categories' do

  let(:user){ FactoryGirl.create(:user) }
  def new_collection_item
    FactoryGirl.create(:collection_item, user_id: user.id)
  end
  let(:collection_item){ new_collection_item }

  it 'basic creation of collection item' do
    expect(collection_item.name).to eq 'Some title 1'
    expect(CollectionItem.count).to eq 1
    expect(Category.count).to eq 2
    expect(CategoryItem.count).to eq 2
    expect(collection_item.categories_as_arr).to eq %w{cat1 cat2}
    expect(collection_item.categories_as_str).to eq 'cat1, cat2'
  end

  it 'should be able to set categories' do
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

  it 'should deal with the repeated use of the same category' do
    collection_item
    expect(Category.where(name: 'cat1').length).to eq 1
    new_collection_item
    expect(Category.where(name: 'cat1').length).to eq 1
    cat_id = Category.where(name: 'cat1').first.id
    expect(CategoryItem.where(category_id: cat_id).length).to eq 2
  end

  it 'should destroy a CollectionItem and its CategoryItems ' do
    collection_item
    new_collection_item
    expect(CategoryItem.count).to eq 4
    CollectionItem.first.destroy
    expect(Category.where(name: 'cat1').length).to eq 1
    expect(CategoryItem.count).to eq 2
  end

  it 'should destroy a Category and its CategoryItems ' do
    collection_item
    new_collection_item
    expect(CollectionItem.count).to eq 2
    expect(CategoryItem.count).to eq 4
    expect(Category.count).to eq 2
    Category.where(name: 'cat1').first.destroy
    expect(CollectionItem.count).to eq 2
    expect(CategoryItem.count).to eq 2
    expect(Category.count).to eq 1
  end



end