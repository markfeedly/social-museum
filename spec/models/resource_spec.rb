require 'spec_helper'

describe Resource do
  let(:resource){ FactoryGirl.create(:resource) }

  # ----------------------------------------------------

  it "resource creation works" do
    expect(resource.user_id).to eq 1
  end

  it "should have verisons" do
    resource.update(title: 'New Title')
    p resource.versions
    expect{ resource.versions }.to eq 1
  end



end

#<ActiveRecord::Associations::CollectionProxy [

# #<Secretary::Version id: 2, version_number: 2, versioned_type: "Resource",
#   versioned_id: 1, user_id: nil, description: "Changed Title and Lock version",
#   object_changes: {"title"=>["Title 1", "New Title"], "lock_version"=>[0, 1]}, created_at: "2014-06-20 15:34:37">,

# #<Secretary::Version id: 1, version_number: 1, versioned_type: "Resource",
#   versioned_id: 1, user_id: nil, description: "Created Resource #1",
# object_changes: {"lock_version"=>[nil, 0], "title"=>[nil, "Title 1"], "description"=>[nil, "Description 1"], "url"=>[nil, "http://example.org/resource_1"], "user_id"=>[nil, 1]}, created_at: "2014-06-20 15:34:37">

# ]>
