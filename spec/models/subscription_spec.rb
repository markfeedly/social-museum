require 'spec_helper'

describe 'Subscription' do
  
  let(:user) {FactoryGirl.create(:user) }
  let(:user1) {FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page, title: 'first title', user: user, content: 'any' ) }

  it "should subscribe page creator" do
    page.subscribers.count.should == 1
    page.subscribers.last.should == user
  end

  it "should subscribe comment creator" do
    page.comments.create(user: user1,
                          commenter: user1.name_or_email,
                          content: 'meh'  )
    page.subscribers.count.should == 2
    page.subscribers.last.should == user1
  end

end
