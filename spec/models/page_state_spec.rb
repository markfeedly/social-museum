require 'spec_helper'

describe 'Previous Page' do

  let(:page){ FactoryGirl.create(:page,
                                 title: 'Title',
                                 content: 'Content',
                                 tags: 't1, t2',
                                 categories: 'c1, c2') }
  let(:page_state) { page.history.last }

  it { page_state.should belong_to(:page) }
  it { page_state.should belong_to(:user) }

  it "should return the correct title" do
    expect(page_state.title).to eq 'Title'
  end

  it "should return the correct content" do
    expect(page_state.content).to eq 'Content'
  end

  it "should return the tags" do
    expect(page_state.tags).to eq 't1, t2'
  end

  it "should return the categories" do
    expect(page_state.categories).to eq 'c1, c2'
  end
end