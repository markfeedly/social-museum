require 'spec_helper'

describe 'Pages Helper' do
  include PageHelper

  before{ FactoryGirl.create(:user) }

  it "should setup page" do
    expect(Page.find_by_title('SPECIAL: Help') ).to eq nil
    expect(get_initalised_page('help').name).to eq 'SPECIAL: Help'

    expect(Page.find_by_title('SPECIAL: Home') ).to eq nil
    expect(get_initalised_page('home').name).to eq 'SPECIAL: Home'

    expect(Page.count).to eq 2
  end

end