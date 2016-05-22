FactoryGirl.define do

  factory :collection_item do
    user_id 1
    sequence(:location)    { |n| "Kilburn" }
    sequence(:item_number) { |n| "1" }

    lock_version  0
    tags nil
    categories nil
  end
end



