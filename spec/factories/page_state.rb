FactoryGirl.define do

  factory :page_state do

    sequence(:title)   { |n| "Post title #{n}" }
    sequence(:content) { |n| "Post content #{n}" }

    association :page
    association :user
  end
end
