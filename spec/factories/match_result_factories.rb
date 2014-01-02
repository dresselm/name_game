FactoryGirl.define do
  factory :match_result do
    winner  { FactoryGirl.create(:contestant) }
    loser   { FactoryGirl.create(:contestant) }

    after(:build) do |rec|
      rec.users << FactoryGirl.create(:user)
    end
  end
end
