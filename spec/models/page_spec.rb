require 'spec_helper'

describe 'Page' do

  let(:user)  { FactoryGirl.create(:user) }
  let(:user1) { FactoryGirl.create(:user) }
  let(:title) { FactoryGirl.create(:title) }
  let(:page)  { FactoryGirl.create(:page,
                                   title:   title,
                                   user_id:     user.id,
                                   description: 'any' ) }

  before {page}


  # ----------------------------------------------------

  describe "Auto-subscription" do
    it "should subscribe page creator" do
      expect(Page.count).to eq 1
      expect(page.subscribers.count).to eq 1
      expect(page.subscribers.last).to eq user
    end


  end


  describe "Assignment" do
    it "of page title" do
      title.update(title: 'new title')
      expect(page.title).to eq('new title')
    end

    it "of page content without recorded history" do
      page.update(description: 'new content')
      expect(page.description).to eq('new content')
    end

    it "of page content with recorded history" do
      page.update(description: 'new content')
      expect(page.history.count).to eq(2)
      expect(page.history.last.description).to eq('new content')
    end

    it "of user without recorded history" do
      page.update(user: user, description: 'new content')
      expect(page.user).to eq(user)
    end

    it "of user with recorded history" do
      page.update(user: user, description: 'new content')
      expect(page.history.count).to eq 2
      expect(page.history.last.user).to eq(user)
    end
  end

  describe "automatic deletions" do
    it "of title when page is destroyed" do
      page
      page.destroy
      expect(Title.count).to eq 0
    end
  end

  describe "History controlled fields, set and get:" do
    specify "categories" do
      page.update(categories: 'Cat1, Cat2')
      expect(page.categories).to eq('Cat1,Cat2')
    end

    specify "content" do
      page.update(description: 'new content')
      expect(page.description).to eq('new content')
    end

    specify "tags" do
      page.update(tags: 'tag1, tag2')
      expect(page.tags).to eq('tag1,tag2')
    end

    specify "title" do
      page.update(title: 'new title')
      expect(page.title).to eq('new title')
    end

    specify "user" do
      page.update(user: user2)
      expect(page.user).to eq(user2)
    end
  end

  describe "Page history" do
    it "page creation results in one page state in page history" do
      expect(page.history).to eq [page_state]
    end

    it "assignment should work correctly using history control" do
      page.update(description: 'new content')
      expect(page.history.count).to eq 2
      expect(page.description).to eq('new content')
      expect(page.history.last.description).to eq('new content')
    end

    it "should have two page states in the history after one change" do
      page.update(user: user, description: 'first change')
      expect(page.history.count).to eq 2
    end

    it "should have three page states in the history after two changes" do
      page.update(user: user, description: 'first change')
      page.update(user: user, description: 'second change')
      expect(page.history.count).to eq 3
    end

    it "page should reflect successive changes" do
      expect{page.update(user: user, title: 'changed title')}.to change{page.title}.to('changed title')
      expect{page.update(user: user, title: 'another title')}.to change{page.lock_version}
      expect{page.update(user: user, description: 'changed content')}.to change{page.description}.to('changed content')
    end

    it "each page's history should only contain that page's past" do
      original_description = page.description
      @page2 = FactoryGirl.create(:page, user: user, description: "check me dude")

      page.update(user: user, description: 'first content change')
      @page2.update(user: user, description: 'dude, first content change')
      page.update(user: user, description: 'second content change')
      @page2.update(user: user, content: 'dude, second content change')

      history = page.history
      expect(history.count).to eq 3
      expect(history[0].description).to eq original_content
      expect(history[1].description).to eq 'first content change'
      expect(history[2].description).to eq 'second content change'

      history = @page2.history
      expect(history.count).to eq 3
      expect(history[0].description).to eq 'check me dude'
      expect(history[1].description).to eq 'dude, first content change'
      expect(history[2].description).to eq 'dude, second content change'
    end
  end

end