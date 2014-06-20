FactoryGirl.define do
  factory :resource do
    sequence(:title) {|n| "Title #{n}" }
    sequence(:description) {|n| "Description #{n}" }
    sequence(:url) {|n| "http://example.org/resource_#{n}" }
    user
  end
end
