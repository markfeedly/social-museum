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
    expect( resource.versions.first.object_changes['title'][1]).to eq 'Title 1'
    expect( resource.versions.last.object_changes['title']).to eq ['Title 1', 'New Title']
    expect( resource.versions[1].object_changes['title'][1]).to eq 'Title 1'
    expect( resource.versions[0].object_changes['title']).to eq ['Title 1', 'New Title']
  end

end

#TODO establish why this is here?
#<ActiveRecord::Associations::CollectionProxy [

# #<Secretary::Version id: 2, version_number: 2, versioned_type: "Resource",
#   versioned_id: 1, user_id: nil, description: "Changed Title and Lock version",
#   object_changes: {"title"=>["Title 1", "New Title"], "lock_version"=>[0, 1]}, created_at: "2014-06-20 15:34:37">,

# #<Secretary::Version id: 1, version_number: 1, versioned_type: "Resource",
#   versioned_id: 1, user_id: nil, description: "Created Resource #1",
#   object_changes: {"lock_version"=>[nil, 0], "title"=>[nil, "Title 1"], "description"=>[nil, "Description 1"],
#     "url"=>[nil, "http://example.org/resource_1"], "user_id"=>[nil, 1]}, created_at: "2014-06-20 15:34:37">

# ]>
