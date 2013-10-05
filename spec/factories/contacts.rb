# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    company_id 1
    primary_contact false
    first_name "MyString"
    last_name "MyString"
    title "MyString"
    phone "MyString"
    email "MyString"
  end
end
