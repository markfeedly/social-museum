FactoryGirl.define do
  factory :categories do
    sequence(:name)   { |n| "Category #{n}"   }
  end
end
