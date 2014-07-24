require 'spec_helper'

describe 'Previous Page' do

  let(:page){ FactoryGirl.create(:page, title: 'Title', content: 'Content', tags: 't1, t2', categories: 'c1, c2') }
  let(:page_state) { page.history.last }

  it { page_state.should belong_to(:page) }
  it { page_state.should belong_to(:user) }

  it "should return the correct title" do
    page_state.title.should == 'Title'
  end

  it "should return the correct content" do
    page_state.content.should == 'Content'
  end

  it "should return the tags" do
    page_state.tags.should == 't1, t2'
  end

  it "should return the categories" do
    page_state.categories.should == 'c1, c2'
  end
end