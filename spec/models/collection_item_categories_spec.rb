require 'spec_helper'

describe 'CollectionItem' do

  let(:collection_item){
    c = CollectionItem.new
    c.title = Title.create!(title: 'aaa')
    c.item_number = '23'
    c.location = 'LF.23'
    c.set_categories_from_string( 'cat2, cat1' )
    c.logged_user_id = 1
    c.save!
    CollectionItem.find(1)
  }
  let(:get_categories){
    [ ['Ferranti Mark I', :isa, 'Computer'],
      ['MU5', :isa, 'Computer'],
      ['Atlas', :isa, 'Computer'],
      ['MU6G', :isa, 'Computer'],
      ['The baby', :isa, 'Computer'],
      ['Manchester Mark 1', :isa, 'Computer'],
      ['Hardware', :is_part_of, 'Computer'],
      ['Software', :is_part_of, 'Computer'],
      ['Memory', :is_part_of, 'Hardware'],
      ['Disc Drive', :is_part_of, 'Hardware'],
      ['CPU', :is_part_of, 'Hardware'],
      ['Zorg', :isa, 'Atlas'],
      ['Zorb', :isa, 'Atlas'],
      ['Zort', :isa, 'MU6G'] ]
  }

  it 'basic' do
    collection_item
    expect(CollectionItem.count).to eq 1
    expect(Category.count).to eq 2
    expect(collection_item.categories_as_arr).to eq %w{cat1 cat2}
    expect(collection_item.categories_as_str).to eq 'cat1, cat2'
    collection_item.add_categories(['cat0'])
    expect(collection_item.categories_as_str).to eq 'cat0, cat1, cat2'
    collection_item.add_categories(['cat3', 'cat0'])
    expect(collection_item.categories_as_str).to eq 'cat0, cat1, cat2, cat3'
    collection_item.add_categories(['cat4', 'cat5'])
    expect(collection_item.categories_as_str).to eq 'cat0, cat1, cat2, cat3, cat4, cat5'
    expect(Category.count).to eq 6

    collection_item.set_categories_from_string('unknown')
    expect(collection_item.categories_as_str).to eq 'cat0, cat1, cat2, cat3, cat4, cat5'

    collection_item.set_categories_from_string(['cat2'])
    expect(collection_item.categories_as_str).to eq 'cat0, cat1, cat2, cat3, cat4, catn'


  end

  it 'should should set and get categories' do
    expect(collection_item.categories).to eq 'Zorg'
    collection_item.categories = 'Zorg, Atlas'
    expect(collection_item.categories).to eq 'Atlas,Zorg'
  end

  it 'should get the right trail' do
    expect(collection_item.category_trail(collection_item.categories, :isa)).to eq [ 'Zorg', 'Atlas', 'Computer']
  end

  it 'should find the inverse set' do
    expect(collection_item.category_inverse_set('Zorg', :isa)).to include('Zorg')
    expect(collection_item.category_inverse_set('Atlas', :isa)).to include('Atlas', 'Zorg')
    expect(collection_item.category_inverse_set('Computer', :isa)).to include("Computer", "MU5", "Atlas", "MU6G", "The baby", "Manchester Mark 1", "Zorg", "Ferranti Mark I")
  end

  it 'should find collection items in the inverse set' do
    expect(collection_item.categorised_in_inverse_set?('Zorg', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('Computer', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('MU6G', :isa)).to eq false
    collection_item.categories = 'c1, MU6G'
    collection_item.save
    expect(collection_item.categories).to eq 'c1,MU6G'
    expect(collection_item.categorised_in_inverse_set?('MU6G', :isa)).to eq true
    expect(collection_item.categorised_in_inverse_set?('Atlas', :isa)).to eq false
    collection_item.categories = 'c1'
    collection_item.save
    expect(collection_item.categorised_in_inverse_set?('Atlas', :isa)).to eq false
  end

end