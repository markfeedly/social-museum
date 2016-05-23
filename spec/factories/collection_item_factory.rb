FactoryGirl.define do
  factory :collection_item do
    title
    user_id      1
    location     "LF display case"
    sequence(:item_number) { |n| "#{n}" }
    sequence(:description) { |n| "Some description #{n}" }
    lock_version  0
    after(:create) do |instance|
      instance.set_categories_from_string('cat1,cat2')
      instance.set_tags_from_string( 'tag2, tag1' )
    end
  end
end



