require 'spec_helper'

describe "link text" do
  it "should return any width used" do
    expect(LinkText.new('foo').width).to eq nil
    expect(LinkText.new('foo bar3').width).to eq nil
    expect(LinkText.new('foo 300').width).to eq 300
    expect(LinkText.new('foo bar3 300').width).to eq 300
    expect(LinkText.new('foo bar3 -3').width).to eq nil
  end

  it "should return text without any width used" do
    expect(LinkText.new('foo').text_no_width).to eq 'foo'
    expect(LinkText.new('foo bar3').text_no_width).to eq 'foo bar3'
    expect(LinkText.new('foo 300').text_no_width).to eq 'foo'
    expect(LinkText.new('foo bar3 300').text_no_width).to eq 'foo bar3'
    expect(LinkText.new('foo bar3 -3').text_no_width).to eq 'foo bar3 -3'
    expect(LinkText.new('foo bar3 0').text_no_width).to eq 'foo bar3 0'
  end
  it "should discern if asset reference or not" do
    expect(LinkText.new('foo bar3 0').asset_reference?).to eq false
    expect(LinkText.new('_foo bar3 0').asset_reference?).to eq false
    expect(LinkText.new('__foo bar3 0').asset_reference?).to eq true
  end
  it "should return the page title" do
    expect(LinkText.new('foo bar3').title).to eq 'foo bar3'
    expect(LinkText.new('_foo bar3').title).to eq '_foo bar3'
    expect(LinkText.new('__foo bar3').title).to eq '_foo bar3'
    expect(LinkText.new('foo bar3 300').title).to eq 'foo bar3'
    expect(LinkText.new('_foo bar3 300').title).to eq '_foo bar3'
    expect(LinkText.new('__foo bar3 300').title).to eq '_foo bar3'
  end
  it "shuld yeild a correct asset url for a given resoource" do
    skip 'need to create a resource for this test'
  end
end