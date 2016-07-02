require 'spec_helper'

describe 'Subscription' do

  def new_user
    FactoryGirl.create(:user)
  end


  def new_page(user = FactoryGirl.create(:user))
    title = FactoryGirl.create(:title)
    FactoryGirl.create(:page,
                       title:   title,
                       user_id: user.id,
                       description: 'any')
  end

  it "should subscribe page creator" do
    page = new_page
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers.last.id).to eq page.user_id
  end

  it "should add another subscriber" do
    page = new_page
    another_user = new_user
    page.subscribe(another_user)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers.last).to eq another_user
  end

  it "should add a subscriber once only" do
    page = new_page
    another_user = new_user
    page.subscribe(another_user)
    page.subscribe(another_user)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(another_user)
    expect(another_user.subscribed_pages).to eq [page]
  end

  it "should keep track of subscribed pages for several users" do
    user = new_user
    page = new_page(user)
    expect(user.subscribed_pages).to eq [page]
    another_user = new_user
    expect(another_user.subscribed_pages).to eq []
    page.subscribe(another_user)
    another_user.reload
    expect(another_user.subscribed_pages).to eq [page]
    another_page = new_page(another_user)
    another_user.reload
    expect(another_user.subscribed_pages).to eq [another_page, page]
    expect(user.subscribed_pages).to eq [page]
  end

  it "should allow a user to subscribe to multiple pages" do
    page1 = FactoryGirl.create(:page,
                                title:       FactoryGirl.create(:title),
                                user_id:     user.id,
                                description: 'anyway' )
    page1.subscribe(user)
    expect(user.subscribed_pages).to include(page, page1)

    page2 = FactoryGirl.create(:page,
                                title:   FactoryGirl.create(:title),
                                user_id:     user.id,
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

  it 'should subscribe page editor' do
    page.update(description: 'new', user_id: user1.id)
    expect(page.subscribers.count).to eq 2
  end

end