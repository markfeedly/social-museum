FactoryGirl.define do

  factory :page do
    association :user
    association :page_title, factory: :title
    sequence(:content) { |n| "Post content #{n}" }
  end
end