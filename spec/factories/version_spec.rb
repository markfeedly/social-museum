FactoryGirl.define do

  factory :version do
    association :user, User.first
    association :page_title, factory: :title

    sequence(:version_number)    { |n| "#{n}" }
    versioned_type "CollectionItem"
    versioned_id   1
    user_id        1
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
