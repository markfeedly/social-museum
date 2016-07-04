require 'spec_helper'

describe "Title" do

  let(:user) { FactoryGirl.create(:user) }
  let(:title) { FactoryGirl.create(:title, title: 'a title') }
  let(:page) { FactoryGirl.create(:page,
                                  title: title,
                                  user_id: user.id,
                                  description: 'any') }

  it "should not save a page with the same title" do
    expect { Page.create!(title: page.title,
                          user: user,
                          description: 'any') }.
        to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Title has already been taken')
  end

  it "should have the correct slug" do
    expect(page.title).to eq 1
    expect(page.slug).to eq 'a-title'
  end

end