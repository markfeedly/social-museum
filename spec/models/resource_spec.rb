require 'spec_helper'

describe Resource do
  let(:resource){ FactoryGirl.create(:resource) }

  # ----------------------------------------------------

  it "creation works and has starting version" do
    expect( resource.versions.count ).to eq 1
  end

  it "should have successive versions" do
    resource.update(title: 'New Title')

    expect( resource.versions.count ).to eq 2

    expect( resource.versions.first.object_changes['title']).to eq [nil, 'Title 1']
    expect( resource.versions.last.object_changes['title']).to eq ['Title 1', 'New Title']

    expect( resource.versions[1].object_changes['title']).to eq [nil, 'Title 1']
    expect( resource.versions[0].object_changes['title']).to eq ['Title 1', 'New Title']
  end

end