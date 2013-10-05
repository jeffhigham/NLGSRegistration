# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    registration_id "MyString"
    payment_status "MyString"
    payment_type "MyString"
  end
end
