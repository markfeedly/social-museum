require 'spec_helper'

describe 'Subscription' do

  let(:user) {FactoryGirl.create(:user) }
  let(:user1) {FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page,
                                 title: 'first title',
                                 user: user,
                                 content: 'any' ) }

  it "should subscribe page creator" do
    page.subscribers.count.should == 1
    page.subscribers.last.should == user
  end

  it "should add a subscriber" do
    page.subscribe(user1)
    page.subscribers.count.should == 2
    page.subscribers.first.should == user
    page.subscribers.last.should == user1
  end

  it "should add a subscriber once only" do
    page.subscribe(user)
    page.subscribe(user1)
    page.subscribe(user1)
    page.subscribers.count.should == 2
    page.subscribers.first.should == user
    page.subscribers.last.should == user1
    user.subscribed_pages.should == [page]
  end

  it "should keep track of subscribed pages for several users" do
    user.subscribed_pages.should == [page]
    user1.subscribed_pages.should == []
    page.subscribe(user1)
    page.subscribers.should include(user, user1)
    user.subscribed_pages.should == [page]
    user1.reload
    user1.subscribed_pages.should == [page]
  end

  it "should allow a user to subscribe to multiple pages" do
    page1 = FactoryGirl.create(:page,
                               title: 'second title',
                               user: user,
                               content: 'anyway' )
    user.subscribed_pages.should == [page, page1]

    page2 = FactoryGirl.create(:page,
                               title: 'fourth title',
                               user: user,
                               content: 'racy' )
    user.reload

    user.subscribed_pages.count.should == 3
    user.subscribed_pages.should include(page, page1, page2)
  end

  it "should subscribe a comment creator" do
    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.subscribers.count.should == 2
    page.subscribers.last.should == user1
  end

  it "should not re-subcribe a comment creator if already subscribed" do
    page.comments.create(user: user,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.subscribers.count.should == 1
    page.subscribers.last.should == user
  end

  it "should not re-subcribe comment creators if already subscribed" do
    page.comments.create(user: user,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.subscribers.count.should == 1
    page.subscribers.last.should == user

    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh 2'  )
    page.subscribers.count.should == 2
    page.subscribers.first.should == user
    page.subscribers.last.should == user1

    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh 3'  )
    page.subscribers.count.should == 2
    page.subscribers.first.should == user
    page.subscribers.last.should == user1
  end

  it "should unsubscribe" do
    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.unsubscribe(user1)
    page.subscribers.count.should == 1
    page.subscribers.last.should == user
  end

end