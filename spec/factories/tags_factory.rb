FactoryGirl.define do
  factory :tags do
    sequence(:name)   { |n| "Tag #{n}"   }
  end
end
