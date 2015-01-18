FactoryGirl.define do

  factory :deal do
    sequence(:id) { |n| n }
    sequence(:user_id) { |n| n }
    property_name "Avaya"
    property_type "Office"
    property_class "A"
    publish true
  end

end