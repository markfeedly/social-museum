require 'spec_helper'

describe 'Pages with unique titles' do

  let(:user) {FactoryGirl.create(:user) }
  let(:page){ FactoryGirl.create(:page,
                                 title: 'first title',
                                 user: user,
                                 content: 'any' ) }

  it 'should not save a page with the same title' do
    expect{Page.create!(title: page.title,
                        user: user,
                        content: 'any' )}.
      to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Title has already been taken')
  end

end