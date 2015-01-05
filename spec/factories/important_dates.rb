# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :important_date do
    deal_id 1
    user_id 1
    title "MyString"
    date "MyString"
  end
end
