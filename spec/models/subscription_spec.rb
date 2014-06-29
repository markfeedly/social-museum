require 'spec_helper'

describe 'Subscription' do

  let(:user) {FactoryGirl.create(:user) }
  let(:user1) {FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page, title: 'first title', user: user, content: 'any' ) }

  it "should subscribe page creator" do
    page.users.count.should == 1
    page.users.last.should == user
  end

  it "should add a subscriber" do
    page.subscribe(user1)
    page.users.count.should == 2
    page.users.first.should == user
    page.users.last.should == user1
  end

  it "should add a subscriber once only" do
    page.subscribe(user)
    page.subscribe(user1)
    page.subscribe(user1)
    page.users.count.should == 2
    page.users.first.should == user
    page.users.last.should == user1
    user.pages.should == [page]
  end

  it "should keep track of subscribed pages for several users" do
    user.pages.should == [page]
    user1.pages.should == []
    page.subscribe(user1)
    page.users.should == [user, user1]
    user.pages.should == [page]
    user1.reload
    user1.pages.should == [page]
  end

  it "should allow a user to subscribe to multiple pages" do
    page1 = FactoryGirl.create(:page, title: 'second title', user: user, content: 'anyway' )
    user.pages.should == [page1, page]

    page2 = FactoryGirl.create(:page, title: 'fourth title', user: user, content: 'racy' )
    user.reload

    user.pages.count.should == 3
    user.pages.include?(page).should == true
    user.pages.include?(page1).should == true
    user.pages.include?(page2).should == true
  end

  it "should subscribe a comment creator" do
    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.users.count.should == 2
    page.users.last.should == user1
  end

  it "should not re-subcribe a comment creator if already subscribed" do
    page.comments.create(user: user,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.users.count.should == 1
    page.users.last.should == user
  end

  it "should not re-subcribe comment creators if already subscribed" do
    page.comments.create(user: user,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.users.count.should == 1
    page.users.last.should == user

    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh 2'  )
    page.users.count.should == 2
    page.users.first.should == user
    page.users.last.should == user1

    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh 3'  )
    page.users.count.should == 2
    page.users.first.should == user
    page.users.last.should == user1
  end

  it "should unsubscribe" do
    page.comments.create(user: user1,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.unsubscribe(user1)
    page.users.count.should == 1
    page.users.last.should == user
  end

end
