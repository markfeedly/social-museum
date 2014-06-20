require 'spec_helper'

describe Resource do
  let(:resource){ FactoryGirl.create(:resource) }

  # ----------------------------------------------------

  it "resource creation works" do
    expect(resource.user_id).to eq 1
  end

  it "should have verisons" do
    resource
    expect(resource.update(title: 'New Title').versions).to eq 1
  end



end
