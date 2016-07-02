require 'spec_helper'

describe 'Subscription' do

  def new_user
    FactoryGirl.create(:user)
  end

  def new_user_and_page
    user = FactoryGirl.create(:user)
    title = FactoryGirl.create(:title)
    page = FactoryGirl.create(:page,
                       title:   title,
                       user_id: user.id,
                       description: 'any')
    [ user, page ]
  end

  def new_page_for_user(user = FactoryGirl.create(:user))
    title = FactoryGirl.create(:title)
    FactoryGirl.create(:page,
                       title:   title,
                       user_id: user.id,
                       description: 'any')
  end

  it "should subscribe page creator" do
    user, page = new_user_and_page
    expect(page.subscribers.count).to eq 1
    expect(page.subscribers.last.id).to eq page.user_id
    expect(page.subscribers.last.id).to eq page.user_id
  end

  it "should add another subscriber" do
    user, page = new_user_and_page
    another_user = new_user
    page.subscribe(another_user)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers.last).to eq another_user
  end

  it "should add a subscriber once only" do
    user, page = new_user_and_page
    another_user = new_user
    page.subscribe(another_user)
    page.subscribe(another_user)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(another_user)
    expect(another_user.subscribed_pages).to eq [page]
  end

  it "should keep track of subscribed pages for several users" do
    first_user, first_page = new_user_and_page
    expect(first_user.subscribed_pages).to eq [first_page]
    second_page = new_page_for_user(first_user)
    first_user.reload
    expect(first_user.subscribed_pages).to eq [second_page, first_page]

    second_user = new_user
    expect(second_user.subscribed_pages).to eq []

    first_page.subscribe(second_user)
    second_user.reload
    expect(second_user.subscribed_pages).to eq [first_page]

    second_page.subscribe(second_user)
    second_user.reload
    expect(second_user.subscribed_pages).to eq [second_page, first_page]
    expect(first_user.subscribed_pages).to eq [second_page, first_page]
  end

  it "should subscribe a comment creator" do
    user, page = new_user_and_page
    second_user = new_user
    page.comments.create(user: second_user, content: 'meh', page_id: page.id)
    expect(page.subscribers.count).to eq 2
    expect(page.subscribers).to include(second_user)
  end

  it "should not re-subcribe a comment creator if already subscribed" do
    user, page = new_user_and_page
    page.comments.create(user: user, content:   'meh', page_id: page.id)
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