require 'spec_helper'

describe 'CollectionItem Tags' do

  let(:collection_item){
    CollectionItem.delete_all
    FactoryGirl.create(:collection_item)
    CollectionItem.first
  }

  it 'basic' do
    collection_item
    expect(CollectionItem.count).to eq 1
    expect(Tag.count).to eq 2
    expect(TagItem.count).to eq 2
    expect(collection_item.tags_as_arr).to eq %w{tag1 tag2}
    expect(collection_item.tags_as_str).to eq 'tag1, tag2'

    collection_item.set_tags_from_string( 'tag2, tag1, tag3' )
    expect(collection_item.tags_as_str).to eq 'tag1, tag2, tag3'
    expect(Tag.count).to eq 3
    expect(TagItem.count).to eq 3

    collection_item.set_tags_from_string( 'tag4' )
    expect(collection_item.tags_as_str).to eq 'tag4'
    expect(Tag.count).to eq 4
    expect(TagItem.count).to eq 1

    collection_item.set_tags_from_string( '' )
    expect(collection_item.tags_as_str).to eq ''
    expect(Tag.count).to eq 4
    expect(TagItem.count).to eq 0
  end

  it 'should delete tag items and preserve tags on deleting a collection item' do
    collection_item.destroy
    expect(CollectionItem.count).to eq 0
    expect(Tag.count).to eq 2
    expect(TagItem.count).to eq 0
  end

  it 'should return tag arrays' do
    expect(collection_item.tags_as_arr).to eq %w{tag1 tag2}
    collection_item.set_tags_from_string( '' )
    expect(collection_item.tags_as_arr).to eq []
  end

  it 'should return tag strings' do
    expect(collection_item.tags_as_str).to eq 'tag1, tag2'
    collection_item.set_tags_from_string( '' )
    expect(collection_item.tags_as_str).to eq ''
  end

  def get_collection_items(cat)
    Tag.where(name: cat).first.all_taged
  end

  def expect_tag_count(cat, cnt)
    expect(Tag.where(name: cat).length).to eq cnt
  end

  it 'should deal with the repeated use of the same tag' do
    collection_item
    expect_tag_count('tag1', 1)
    FactoryGirl.create(:collection_item)
    expect_tag_count('tag1', 1)
    cat = Tag.where(name: 'tag1').first
    cat_id = cat.id
    expect(TagItem.where(tag_id: cat_id).length).to eq 2
  end

  it 'should destroy a CollectionItem and its TagItems ' do
    collection_item
    FactoryGirl.create(:collection_item)
    expect(TagItem.count).to eq 4
    CollectionItem.first.destroy
    expect_tag_count('tag1', 1)
    expect(TagItem.count).to eq 2
  end

  it 'should destroy a Tag and its TagItems ' do
    collection_item
    FactoryGirl.create(:collection_item)
    expect(CollectionItem.count).to eq 2
    expect(TagItem.count).to eq 4
    expect(Tag.count).to eq 2
    Tag.where(name: 'tag1').first.destroy
    expect(CollectionItem.count).to eq 2
    expect(TagItem.count).to eq 2
    expect(Tag.count).to eq 1
  end

  it 'test presence of tag or not' do
    expect(collection_item.has_tag?('tag1')).to eq true
    expect(collection_item.has_tag?('not tag')).to eq false
  end

end