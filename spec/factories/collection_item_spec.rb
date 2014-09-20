FactoryGirl.define do

  factory :collection_item do
    user_id 1
    title
    sequence(:description) { |n| "Collection item content" }
    sequence(:location)    { |n| "Kilburn" }
    sequence(:item_number) { |n| "1" }

    lock_version  0
    tags          ''
    categories    ''
  end
end



