require 'spec_helper'

describe 'Model deletion' do

  let(:user) {FactoryGirl.create(:user) }
  let(:page) {FactoryGirl.create(:page, user: user, title: 'Some title')}
  let(:collection_item){FactoryGirl.create(:collection_item) }
  let(:collection_item_version){FactoryGirl.create(:version, user: user, versioned: collection_item) }

  it "should delete title when page is destroyed" do
    page
    expect(Title.count).to eq 1
    Page.first.destroy
    expect(Page.count).to eq 0
    expect(Title.count).to eq 0
  end

  it "should delete title and versions when collection item is destroyed" do
    #collection_item_version
    p collection_item
    expect(Title.count).to eq 1
    CollectionItem.first.destroy
    expect(CollectionItem.count).to eq 0
    expect(Title.count).to eq 0
  end

end