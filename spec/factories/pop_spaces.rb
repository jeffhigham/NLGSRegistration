# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pop_space, :class => 'PopSpaces' do
    display_type "MyString"
    size "MyText"
  end
end
