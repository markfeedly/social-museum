require 'spec_helper'

describe 'Page' do

  let(:page){ FactoryGirl.create(:page, categories: 'Zorg', title: 'Example', content: 'Text') }
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

  it 'should should set and get categories' do
    expect(page.categories).to eq 'Zorg'
    page.categories = 'Zorg, Atlas'
    expect(page.categories).to eq 'Atlas,Zorg'
  end

  it 'should get the right trail' do
    expect(page.category_trail(page.categories, :isa)).to eq [ 'Zorg', 'Atlas', 'Computer']
  end

  it 'should find the inverse set' do
    expect(page.category_inverse_set('Zorg', :isa)).to include('Zorg')
    expect(page.category_inverse_set('Atlas', :isa)).to include('Atlas', 'Zorg')
    expect(page.category_inverse_set('Computer', :isa)).to include("Computer", "MU5", "Atlas", "MU6G", "The baby", "Manchester Mark 1", "Zorg", "Ferranti Mark I")
  end

  it 'should find pages in the inverse set' do
    expect(page.categorised_in_inverse_set?('Zorg', :isa)).to eq true
    expect(page.categorised_in_inverse_set?('Computer', :isa)).to eq true
    expect(page.categorised_in_inverse_set?('MU6G', :isa)).to eq false
    page.categories = 'c1, MU6G'
    page.save
    expect(page.categories).to eq 'c1,MU6G'
    expect(page.categorised_in_inverse_set?('MU6G', :isa)).to eq true
    expect(page.categorised_in_inverse_set?('Atlas', :isa)).to eq false
    page.categories = 'c1'
    page.save
    expect(page.categorised_in_inverse_set?('Atlas', :isa)).to eq false
  end

end