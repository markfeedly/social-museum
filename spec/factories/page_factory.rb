FactoryGirl.define do

  factory :page do

    sequence(:title)   { |n| "Post title #{n}"   }
    sequence(:content) { |n| "Post content #{n}" }

    user
  end
end