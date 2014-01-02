FactoryGirl.define do
  factory :name do
    name { Forgery::Name.first_name }
    is_first_name true
    is_middle_name false
  end

  factory :middle_name, :class => Name do
    name { Forgery::Name.first_name }
    is_first_name false
    is_middle_name true
  end
end
