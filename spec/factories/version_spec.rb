FactoryGirl.define do

  factory :version, :class => "Secretary::Version" do
    user_id 1
    versioned { |v| v.association :collection_item }
    sequence(:version_number)    { |n| "#{n}" }
    versioned_type "CollectionItem"
    versioned_id   1
    sequence(:description) { |n| "Collection item content" }
    object_changes {{"lock_version" => [nil, 0],
                     "categories"   =>[nil, ""],
                     "description"  =>[nil, "Collection item content"],
                     "item_number"  =>[nil, "1"],
                     "location"     =>[nil, "Kilburn"],
                     "tags"         =>[nil, ""],
                     "title"        =>[{}, {"title"=>"Some title"}]}}
  end
end
