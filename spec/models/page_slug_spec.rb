require 'spec_helper'

describe 'Title slug' do

  let(:user) {FactoryGirl.create(:user) }
  let(:title){FactoryGirl.create(:title, title: 'First Title') }

  it "should make a title slug" do
    expect(title.slug).to eq 'first-title'
  end
end