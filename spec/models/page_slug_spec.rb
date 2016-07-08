require 'spec_helper'

describe 'Title slug' do

  def new_collection_item
    FactoryGirl.create(:collection_item, user_id: user.id, title: FactoryGirl.create(:title, title: 'First Title') )
  end
  let(:title){FactoryGirl.create(:title, title: 'First Title') }
  let(:user){ FactoryGirl.create(:user) }
  let(:collection_item){ new_collection_item }


  it "should make a title slug" do
    expect(title.slug).to eq 'first-title'
  end

  it "should prevent slug and title reuse" do

    #todo work out if want to reuse previously used but not used now titles, and improve slug handling
    # this test fails thus ActiveRecord::RecordInvalid: Validation failed: Title has already been taken, Slug has already been taken

    expect(title.slug).to eq 'first-title'
    collection_item.destroy
    expect(new_collection_item.slug).to eq 'dont get here at the moment'
  end
end