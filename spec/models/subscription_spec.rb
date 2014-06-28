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
    user1.pages.should == [page]
  end

  it "should deal wiht multiple subscribed pages for users" do
    page1 = FactoryGirl.create(:page, title: 'second title', user: user, content: 'anyway' )
    user.pages.should == [page1, page]

    page2 = FactoryGirl.create(:page, title: 'fourth title', user: user, content: 'racy' )
    user.pages.count.should == 3
    p user.pages
    user.pages.count.should == 3
    user.pages.include?(page).should == true
    user.pages.include?(page1).should == true
    page2.users.should == [user]
    user.pages.include?(page2).should == true
  end



  it "should subscribe comment creator" do
    FactoryGirl.create(:comment, user: user1, page: page,
                          commenter: user1.name_or_anonymous_user,
                          content: 'meh'  )
    page.users.count.should == 2
    page.users.last.should == user1
  end

  it "should not subcribe if already subscribed" do
    page.comments.create(user: user,
                         commenter: user.name_or_anonymous_user,
                         content: 'meh'  )
    page.users.count.should == 1
    page.users.last.should == user
  end

  it "should not subcribe if already subscribed repeat tests" do
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
