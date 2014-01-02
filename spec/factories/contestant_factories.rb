FactoryGirl.define do
  factory :contestant do
    first_name  { FactoryGirl.create(:name) }
    middle_name { FactoryGirl.create(:middle_name) }
  end
end
