# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    date '04-09-2014'
    user_id 2
    content "MyText"
  end
end
