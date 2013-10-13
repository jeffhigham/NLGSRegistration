# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prototype_space, :class => 'PrototypeSpaces' do
    display_type "MyString"
    size "MyText"
  end
end
