# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commenter "MyString"
    content "MyText"
    page nil
    user nil
  end
end
