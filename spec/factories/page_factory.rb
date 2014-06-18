FactoryGirl.define do
  factory :page do
    sequence(:title) {|n| "Post Title #{n}" }
  end
end