require 'spec_helper'

describe 'Model deletion' do

  let(:user) {FactoryGirl.create(:user) }
  let(:page) {FactoryGirl.create(:page, user: user, title: 'Some title')}
  #let(:collection_item){FactoryGirl.create(:collection_item, user: :user, title: 'First Title') }
  #let(:collection_item_version){FactoryGirl.create(:version, user: user) }

  it "should delete for page" do
    p page.page_title
    #expect(Title.count).to eq nil
  end
end