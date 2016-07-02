FactoryGirl.define do

  factory :resource do

    sequence(:description) { |n| "Description #{n}"                 }
    sequence(:url)         { |n| "http://example.org/resource_#{n}" }

    user
  end
end
