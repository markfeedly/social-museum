FactoryGirl.define do
  factory :title do
    sequence(:title)   { |n| "Some title"   }
  end
end

