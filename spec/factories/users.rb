# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Davida"
    email "davida@davida.com"
    password "MyString"
    password_confirmation "MyString"
  end

  factory :user1, class: User do
    name "Davida"
    email "davida@davida.com"
    password "MyString"
    password_confirmation "MyString"
  end
end
