FactoryGirl.define do
  
  factory :contact do
    sequence(:id) { |n| n }
    sequence(:user_id) { |n| n }
    full_name "John Doe"
    phone_number "1231231234"
    job_title "VP"
    email "jdoe@gmail.com"
    company "Apex Equities"
  end

end