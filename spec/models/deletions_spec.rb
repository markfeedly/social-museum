require 'spec_helper'

describe 'Model deletion' do
  def new_collection_item
    title = FactoryGirl.create(:title)
    FactoryGirl.create(:collection_item, user_id: user.id, title: title)
  end

  def new_page
    title = FactoryGirl.create(:title)
    FactoryGirl.create(:page, user_id: user.id, title: title)
  end

  let(:user) {FactoryGirl.create(:user) }
  let(:page) { new_page }
  let(:collection_item){ new_collection_item }

  it "should delete title when page is destroyed" do
    page
    expect(Title.count).to eq 1
    Page.first.destroy
    expect(Page.count).to eq 0
    expect(Title.count).to eq 0
  end

  it "should delete title when collection item is destroyed" do
    collection_item
    expect(Title.count).to eq 1
    CollectionItem.first.destroy
    expect(CollectionItem.count).to eq 0
    expect(Title.count).to eq 0
  end

  it "should delete versions when collection item is destroyed" do
    collection_item
    #todo   it "should delete versions when collection item is destroyed" do
  end

end