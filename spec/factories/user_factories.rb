FactoryGirl.define do
  factory :user do
    email_address { Forgery::Internet.email_address }
    last_name { Forgery::Name.last_name }
  end
end
