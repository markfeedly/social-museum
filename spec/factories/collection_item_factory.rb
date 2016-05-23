FactoryGirl.define do
  factory :collection_item do
    user_id      1
    location     "LF display case"
    sequence(:item_number) { |n| "#{n}" }
    lock_version  0
    after(:create) {|instance| instance.set_categories_from_string('cat1,cat2') }
  end
end



