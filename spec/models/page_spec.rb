require 'spec_helper'

describe Page do
  def user() @user end
  def page() @page end
  def page_state() @page_state end
  def user2() @user2 end

  before(:each) do
    @user = FactoryGirl.create(:user)
    @page = FactoryGirl.create(:page, user: @user, content: 'check me')
    @page_state = @page.history.last
    @user2 = FactoryGirl.create(:user)
    subject {@page}
  end

  it { page_state.should validate_presence_of(:title) }
  it { page_state.should validate_presence_of(:content) }

  it "page creation results in one page state in page history" do
    page.history.should == [page_state]
  end

  it "assignment should work correctly using history control" do
    page.update(content: 'new content')
    expect(page.history.count).to eq 2
    expect(page.content).to eq('new content')
    expect(page.history.last.content).to eq('new content')
  end

  it "assignment should work correctly for title" do
    page.update(title: 'new title')
    expect(page.history.count).to eq(2)                           # <<<< fails
    expect(page.title).to eq('new title')
    expect(page[:title]).to eq('new title')
    expect(page.history.last.title).to eq('new title')
  end

  it "assignment should work correctly using history control multiple times in update" do
    page.update(user: user, content: 'new content')
    expect(page.history.count).to eq 2
    expect(page.history.last.user).to eq(user)
    expect(page.history.last.content).to eq('new content')
  end

  it "assignment should work correctly using history control with title in update" do
    page.update(user: user, title: 'new title')
    expect(page.history.count).to eq 2                          # <<<< fails
    expect(page.history.last.user).to eq(user)
    expect(page.history.last.title).to eq('new title')
  end

  it "should set and get all history controlled attribtes" do
    page.update(categories: 'Cat1, Cat2')
    expect(page.categories).to eq('Cat1, Cat2')

    page.update(content: 'new content')
    expect(page.content).to eq('new content')

    page.update(item_number: '123')
    expect(page.item_number).to eq('123')

    page.update(location: user2)
    expect(page.location).to eq(user2)

    page.update(tags: 'tag1, tag2')
    expect(page.tags).to eq('tag1, tag2')

    page.update(user: user2)
    expect(page.user).to eq(user2)
  end

  it "should have one past page after one change" do
    page.update(user: user, content: 'first change')
    expect(page.history.count).to eq 2
  end

  it "should have two past pages after two changes" do
    page.update(user: user, content: 'first change')
    page.update(user: user, content: 'second change')
    expect(page.history.count).to eq 3
  end

  it 'page should reflect successive changes' do
    expect{page.update(user: user, title: 'changed title')}.to change{page.title}.to('changed title')
    p page.lock_version
                              # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    expect{page.update(user: user, content: 'changed content', lock_version: 0)}.to change{page.content}.to('changed content')
  end

  it "each page's history should only contain that page's past" do
    original_content = page.content
    @page2 = FactoryGirl.create(:page, user: @user, content: "check me dude")

    page.update(user: user, content: 'first content change')
    @page2.update(user: user, content: 'dude, first content change')
    page.update(user: user, content: 'second content change')
    @page2.update(user: user, content: 'dude, second content change')

    history = page.history
    history.count.should == 3
    history[0].content.should == original_content
    history[1].content.should == 'first content change'
    history[2].content.should == 'second content change'

    history = @page2.history
    history.count.should == 3
    history[0].content.should == 'check me dude'
    history[1].content.should == 'dude, first content change'
    history[2].content.should == 'dude, second content change'
  end
end





