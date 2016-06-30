require 'spec_helper'

describe 'Title slug' do

  def new_collection_item
    FactoryGirl.create(:collection_item, user_id: user.id)
  end

  let(:user){ FactoryGirl.create(:user) }
  let(:collection_item){ new_collection_item }

  let(:user) {FactoryGirl.create(:user) }
  let(:title){FactoryGirl.create(:title, title: 'First Title') }

  it "should make a title slug" do
    expect(title.slug).to eq 'first-title'
  end
end