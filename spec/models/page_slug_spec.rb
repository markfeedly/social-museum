require 'spec_helper'

describe 'Page slug' do

  let(:user) {FactoryGirl.create(:user) }
  let(:page) {FactoryGirl.create(:page,
                                 title: 'first title',
                                 user: user,
                                 content: 'any' ) }

  it "should make a page slug" do
    expect(page.slug).to eq 'first-title'
  end

  it "should downcase slug" do
    expect(FactoryGirl.create(:page,
                              title: 'FirSt Title 1',
                              user: user,
                              content: 'any' ).
           slug).to eq 'first-title-1'
  end

  it "should append a number based on slug clashes" do
    expect(FactoryGirl.create(:page,
                              title: 'title',
                              user: user,
                              content: 'any' ).
               slug).to eq 'title'

    expect(FactoryGirl.create(:page,
                              title: 'Title',
                              user: user,
                              content: 'any' ).
               slug).to eq 'title-1'

    expect(FactoryGirl.create(:page,
                              title: 'titlE',
                              user: user,
                              content: 'any' ).
               slug).to eq 'title-2'
    end
end