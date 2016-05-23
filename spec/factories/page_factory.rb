FactoryGirl.define do
  factory :page do
    user_id      1
    lock_version  0
    sequence(:description) { |n| "Some description #{n}" }
    after(:create) do |instance|
      instance.set_categories_from_string('cat1,cat2')
      instance.set_tags_from_string( 'tag2, tag1' )
    end
  end
end