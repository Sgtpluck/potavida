# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Davida"
    email "davida@davida.com"
    password "MyString"
    password_confirmation "MyString"
    role "Admin"
    id 4
  end

  factory :user1, class: User do
    name "Davida"
    email "davida@davida.com"
    password "MyString"
    password_confirmation "MyString"
    role "Admin"
  end

  factory :user_manager, class: User do
    name "Blake"
    email "Blake@blake.com"
    password "apassword"
    password_confirmation "apassword"
    role "Manager"
  end

  factory :user_client, class: User do
    name "WorldVision"
    email "wv@email.com"
    password "MyString"
    password_confirmation "MyString"
    role "Client"
  end
end
