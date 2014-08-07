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

  it 'should be available' do
    page.get_page_types.should == [["Collection item", :isa, "Type"], ["Person", :isa, "Type"], ["Other", :isa, "Type"]]
  end

  it 'should should set and get categories' do
    page.categories.should == 'Zorg'
    page.categories = 'Zorg, Atlas'
    page.categories.should == 'Atlas,Zorg'
  end

  it 'should get the right trail' do
    page.category_trail(page.categories, :isa).should == [ 'Zorg', 'Atlas', 'Computer']
  end

  it 'should find the inverse set' do
    page.category_inverse_set('Zorg', :isa).should include('Zorg')
    page.category_inverse_set('Atlas', :isa).should include('Atlas', 'Zorg')
    page.category_inverse_set('Computer', :isa).should include("Computer", "MU5", "Atlas", "MU6G", "The baby", "Manchester Mark 1", "Zorg", "Ferranti Mark I")
  end

  it 'should find pages in the inverse set' do
    page.categorised_page_in_inverse_set('Zorg', :isa).should == true
    page.categorised_page_in_inverse_set('Computer', :isa).should == true
    page.categorised_page_in_inverse_set('MU6G', :isa).should == false
    page.categories = 'c1, MU6G'
    page.save
    page.categories.should == 'c1,MU6G'
    page.categorised_page_in_inverse_set('MU6G', :isa).should == true
    page.categorised_page_in_inverse_set('Atlas', :isa).should == false
    page.categories = 'c1'
    page.save
    page.categorised_page_in_inverse_set('Atlas', :isa).should == false
  end

end