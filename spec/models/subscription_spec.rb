require 'spec_helper'

describe 'Subscription' do

  let(:user)  { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:title) { FactoryGirl.create(:title) }
  let(:page)  { FactoryGirl.create(:page,
                                    title:   title,
                                    user:     user,
                                    description: 'any' ) }
  before {page}

  it "should subscribe page creator" do
    expect(Page.count).to eq 1
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers.last).to eq user
  end

  it "should add a subscriber" do
    page.subscribe(user1)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers.first).to eq user
    expect(page.subscribers.last).to eq user1
  end

  it "should add a subscriber once only" do
    page.subscribe(user1)
    page.subscribe(user1)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(user)
    expect(page.subscribers).to include(user1)
    expect(user.subscribed_pages).to eq [page]
  end

  it "should keep track of subscribed pages for several users" do
    expect(user.subscribed_pages).to eq [page]
    expect(user1.subscribed_pages).to eq []
    page.subscribe(user1)
    expect(page.subscribers).to include(user, user1)
    expect(user.subscribed_pages).to eq [page]
    user1.reload
    expect(user1.subscribed_pages).to eq [page]
  end

  it "should allow a user to subscribe to multiple pages" do
    page1 = FactoryGirl.create(:page,
                                title:   FactoryGirl.create(:title),
                                user:     user,
                                description: 'anyway' )
    page1.subscribe(user)
    expect(user.subscribed_pages).to include(page, page1)

    page2 = FactoryGirl.create(:page,
                                title:   FactoryGirl.create(:title),
                                user:     user,
                                description: 'racy' )
    page2.subscribe(user)
    user.reload

    expect(user.subscribed_pages.count).to eq 3
    expect(user.subscribed_pages).to include(page, page1, page2)
  end

  it "should subscribe a comment creator" do
    page.comments.create(user:       user1,
                         content:   'meh'  )
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(user1)
  end

  it "should not re-subcribe a comment creator if already subscribed" do
    page.comments.create(user:       user,
                         content:   'meh'  )
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers).to include(user)
  end

  it "should not re-subcribe comment creators if already subscribed" do
    page.comments.create(user:       user,
                         content:   'meh'  )
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers).to include(user)

    page.comments.create(user:       user1,
                         content:   'meh 2'  )
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(user)
    expect(page.subscribers).to include(user1)

    page.comments.create(user:       user1,
                         content:   'meh 3'  )
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(user)
    expect(page.subscribers).to include(user1)
  end

  it "should unsubscribe" do
    page.comments.create(user:       user1,
                         content:   'meh'  )
    page.unsubscribe(user1)
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers).to include(user)
  end

end