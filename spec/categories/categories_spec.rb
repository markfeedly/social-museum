require 'spec_helper'

describe 'Page' do

  let(:page){ FactoryGirl.create(:page, categories: 'Zorg', title: 'Example', content: 'Text') }
  let(:ld_categories){
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
    page.ld_page_type.should == [["Collection item", :isa, "Type"], ["Person", :isa, "Type"], ["Other", :isa, "Type"]]
  end

  it 'should should set and get categories' do
    page.categories.should == 'Zorg'
    page.categories = 'Zorg, Atlas'
    page.categories.should == 'Atlas, Zorg'
  end

  it 'should get the right trail' do
    page.ld_trail(page.categories, :isa).should == [ 'Computer', 'Atlas', 'Zorg']
  end

  it 'should get the right trails' do
    page.ld_trails('Zorg', :isa).should ==       [ [ 'Computer', 'Atlas', 'Zorg'] ]
    page.ld_trails('MU6G, Zorg', :isa).should == [ [ 'Computer', 'MU6G'],[ 'Computer', 'Atlas', 'Zorg']  ]
  end

  it 'should assert transitive predicates' do
    page.ld_assert( 'Zorg', :isa, 'Computer' ).should == true

    page.ld_assert( 'Computer', :isa, 'Zorg' ).should == false
    page.ld_assert( 'Zorg', :isa, 'Zorg' ).should == false

    page.ld_assert( 'xx', :isa, 'Computer' ).should == false
    page.ld_assert( 'Zorg', :isa, 'xx' ).should == false
  end

  it 'should find the inverse set' do
    pending "Zorb, Zort and Ferranti Mark 1 are not in the ld_categories in the codebase. Which category list is correct?"
    page.ld_inverse_set('Zorg', :isa).should == ['Zorg']
    page.ld_inverse_set('Atlas', :isa).should == ['Atlas', 'Zorg', 'Zorb']
    page.ld_inverse_set('Computer', :isa).should == ["Computer", "MU5", "Atlas", "MU6G", "The baby", "Manchester Mark 1", "Zorg", "Zorb", "Zort"]
  end

  it 'should find pages in the inverse set' do
    page.ld_page_in_inverse_set('Zorg', :isa).should == true
    page.ld_page_in_inverse_set('Computer', :isa).should == true
    page.ld_page_in_inverse_set('MU6G', :isa).should == false
    page.categories = 'c1, MU6G'
    page.save
    page.categories.should == 'c1, MU6G'
    page.ld_page_in_inverse_set('MU6G', :isa).should == true
    page.ld_page_in_inverse_set('Atlas', :isa).should == false
    page.categories = 'c1'
    page.save
    page.ld_page_in_inverse_set('Atlas', :isa).should == false
  end

end