require 'spec_helper'

describe 'Page' do

  let(:ci){ FactoryGirl.create(:collection_item,   description: 'Text') }

  it 'should should set and get tags' do
    p ci.tags
    #expect(ci.tags).to eq 'your tag'
    #ci.tags = 'your tag, my tag'
    #expect(ci.tags).to eq 'my tag,your tag'
  end

  # deal appropriately with tags for both collection items and pages below

=begin
  it 'should deal with leading and trailing spaces in tag input' do
    page.tags='     '
    expect(page.tags).to eq ''
    page.tags=' a , this is a tag , c , d '
    expect(page.tags).to eq 'a,c,d,this is a tag'
  end

  it 'should deal with replicated tags' do
    page.tags=' a , a,c, this is a tag ,a, c , d '
    expect(page.tags).to eq 'a,c,d,this is a tag'
  end

  it 'should be able to test for presence and absence of tags' do
    page.tags=' '
    expect(page.has_tag?('a')).to eq false
    page.tags = 'a'
    expect(page.has_tag?('a')).to eq true
    expect(page.has_tag?('b')).to eq false
    page.tags = 'a,b,c'
    expect(page.has_tag?('a')).to eq true
    expect(page.has_tag?('b')).to eq true
    expect(page.has_tag?('c')).to eq true
    expect(page.has_tag?('d')).to eq false
  end

  it 'should be able to create an array of tags'do
    page.tags=' '
    expect(page.tags_as_arr).to eq []
    page.tags = 'a'
    expect(page.tags_as_arr).to eq ['a']
    page.tags = 'a,b,c'
    expect(page.tags_as_arr).to eq ['a', 'b', 'c']
  end
=end

end