require 'spec_helper'

describe 'Pages with unique titles' do

  let(:user) {FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page, title: 'first title', user: user, content: 'any' ) }
  let(:ps){ page.history.last }

  it 'should not save a page with the same title' do
    Page.create(title: page.title, user: user, content: 'any' ).id.should == nil
  end



end