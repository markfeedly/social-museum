FactoryGirl.define do
  factory :comment do
    user "Commenter"
    content "MyText"
    page nil
  end
end
