FactoryGirl.define do
  
  factory :user do
    sequence(:id) { |n| n }
    sequence(:firstname) { |n| "Michael_#{n}" }
    lastname "McDevitt"
    sequence(:username) { |n| "mmcdevi#{n}" }
    sequence(:email) { |n| "mike#{n}@gmail.com" }
    password "koplop11"
    password_confirmation "koplop11"
  end

end