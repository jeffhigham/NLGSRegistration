# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    type ""
    name "MyString"
    division "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
    phone "MyString"
    fax "MyString"
    email "MyString"
    website "MyString"
    description "MyText"
  end
end
