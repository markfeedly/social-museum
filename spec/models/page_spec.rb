require 'spec_helper'

describe Page do

  let(:user){ FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page,
                                 user: user,
                                 content: 'check me') }
  let(:page_state){ page.history.last }
  let(:user2){ FactoryGirl.create(:user) }

  before(:each) do
    page.reload
  end

  # ----------------------------------------------------

  describe "Validations" do
    it { page.should validate_presence_of(:title)   }
    it { page.should validate_uniqueness_of(:title) }

    it { page.should validate_presence_of(:content) }

    it { page.should validate_uniqueness_of(:slug)  }
  end

  describe "Assignment" do
    it "of page title without recorded history" do
      page.update(title: 'new title')
      expect(page.title).to eq('new title')
    end

    it "of page title with recorded history" do
      page.update(title: 'new title')
      expect(page.history.count).to eq(2)
      expect(page.history.last.title).to eq('new title')
    end

    it "of page content without recorded history" do
      page.update(content: 'new content')
      expect(page.content).to eq('new content')
    end

    it "of page content with recorded history" do
      page.update(content: 'new content')
      expect(page.history.count).to eq(2)
      expect(page.history.last.content).to eq('new content')
    end

    it "of user without recorded history" do
      page.update(user: user, content: 'new content')
      expect(page.user).to eq(user)
    end

    it "of user with recorded history" do
      page.update(user: user, content: 'new content')
      expect(page.history.count).to eq 2
      expect(page.history.last.user).to eq(user)
    end
  end

  describe "History controlled fields, set and get:" do
    specify "categories" do
      page.update(categories: 'Cat1, Cat2')
      expect(page.categories).to eq('Cat1,Cat2')
    end

    specify "content" do
      page.update(content: 'new content')
      expect(page.content).to eq('new content')
    end

    specify "item number" do
      page.update(item_number: '123')
      expect(page.item_number).to eq('123')
    end

    specify "location" do
      page.update(location: user2)
      expect(page.location).to eq(user2)
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
      page.history.should == [page_state]
    end

    it "assignment should work correctly using history control" do
      page.update(content: 'new content')
      expect(page.history.count).to eq 2
      expect(page.content).to eq('new content')
      expect(page.history.last.content).to eq('new content')
    end

    it "should have two page states in the history after one change" do
      page.update(user: user, content: 'first change')
      expect(page.history.count).to eq 2
    end

    it "should have three page states in the history after two changes" do
      page.update(user: user, content: 'first change')
      page.update(user: user, content: 'second change')
      expect(page.history.count).to eq 3
    end

    it "page should reflect successive changes" do
      expect{page.update(user: user, title: 'changed title')}.to change{page.title}.to('changed title')
      expect{page.update(user: user, title: 'another title')}.to change{page.lock_version}
      expect{page.update(user: user, content: 'changed content')}.to change{page.content}.to('changed content')
    end

    it "each page's history should only contain that page's past" do
      original_content = page.content
      @page2 = FactoryGirl.create(:page, user: user, content: "check me dude")

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

end