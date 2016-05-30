require 'spec_helper'

describe 'Category Extensions' do

  let(:collection_item){ FactoryGirl.create(:collection_item) }

  it 'should get the right trail' do
    expect(Category.category_trail('VUM Atlas', :isa)).to eq ['VUM Atlas', 'Atlas', 'Computer']
  end

  it 'should find the inverse set' do
    expect(collection_item.category_and_children('VUM Atlas')).to eq(['VUM Atlas'])
    expect(collection_item.category_and_children('Atlas')).to eq(['Atlas', 'VUM Atlas'])
    expect(collection_item.category_and_children('Computer')).to eq(["Atlas", "Computer", "Ferranti Mark I", "MU5", "SSEM", "VUM Atlas"])
  end

  it 'should support finding' do
    collection_item.set_categories_from_string( 'Atlas, Hydrostatic' )
    expect(collection_item.in_category_and_its_children?('Computer')).to eq true
    expect(collection_item.in_category_and_its_children?('SSEM')).to eq false

  end

  it 'should find collection items in the inverse set' do

    collection_item.set_categories_from_string( 'not in table' )
    expect(collection_item.in_categories_and_children?('VUM Atlas')).to eq false
    expect(collection_item.in_categories_and_children?('Atlas')).to eq false
    expect(collection_item.in_categories_and_children?('Computer')).to eq false

    collection_item.set_categories_from_string( 'VUM Atlas' )
    expect(collection_item.in_categories_and_children?('VUM Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Computer')).to eq true
    expect(collection_item.in_categories_and_children?('SSEM')).to eq false

    collection_item.set_categories_from_string('not in table, VUM Atlas')
    expect(collection_item.in_categories_and_children?('VUM Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Computer')).to eq true
    expect(collection_item.in_categories_and_children?('SSEM')).to eq false

    collection_item.set_categories_from_string('SSEM, Computer, not in table, VUM Atlas')
    expect(collection_item.in_categories_and_children?('VUM Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Atlas')).to eq true
    expect(collection_item.in_categories_and_children?('Computer')).to eq true
    expect(collection_item.in_categories_and_children?('SSEM')).to eq true
    expect(collection_item.in_categories_and_children?('MU5')).to eq false
  end

end