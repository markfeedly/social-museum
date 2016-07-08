require 'spec_helper'

describe 'CollectionItem Categories' do

  def new_collection_item
    FactoryGirl.create(:collection_item, user_id: user.id)
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:collection_item) { new_collection_item }
  let(:all_triples) { [["Manchester computer", :isa, "Computer"],
                       ["Ferranti Mark I", :isa, "Manchester computer"],
                       ["MU5", :isa, "Manchester computer"],
                       ["MU6G", :isa, "Manchester computer"],
                       ["SSEM", :isa, "Manchester computer"],
                       ["Atlas", :isa, "Manchester computer"],
                       ["VUM Atlas", :isa, "Atlas"],
                       ["Other computer", :isa, "Computer"],
                       ["PDP-11", :isa, "Other computer"]] }

  it "should get categories" do
    expect(collection_item.get_categories).to eq all_triples
    expect(Category.get_categories).to eq collection_item.get_categories


  end

  it "should get a fully specified triple" do
    expect(Category.get_matches('MU5', :isa, 'Computer')).to eq [["MU5", :isa, "Manchester computer"]]
  end

  it "should get a single triple" do
    expect(Category.get_matches(nil,  nil,  nil) ).to eq all_triples
    expect(Category.get_matches(nil,  nil,  "Manchester computer")).to eq [["Ferranti Mark I", :isa, "Manchester computer"], ["MU5", :isa, "Manchester computer"], ["MU6G", :isa, "Manchester computer"], ["SSEM", :isa, "Manchester computer"], ["Atlas", :isa, "Manchester computer"]]
    expect(Category.get_matches(nil,  :isa, nil)).to eq all_triples
    expect(Category.get_matches(nil,  :isa, "Manchester computer")).to eq [["Ferranti Mark I", :isa, "Manchester computer"], ["MU5", :isa, "Manchester computer"], ["MU6G", :isa, "Manchester computer"], ["SSEM", :isa, "Manchester computer"], ["Atlas", :isa, "Manchester computer"]]

    expect(Category.get_matches('MU5', nil, nil)).to eq [["MU5", :isa, "Manchester computer"]]
    expect(Category.get_matches('MU5', nil, "Manchester computer")).to eq [["MU5", :isa, "Manchester computer"]]
    expect(Category.get_matches('MU5', :isa, nil)).to eq [["MU5", :isa, "Manchester computer"]]
    expect(Category.get_matches('MU5', :isa, "Manchester computer")).to eq [["MU5", :isa, "Manchester computer"]]
  end

end
