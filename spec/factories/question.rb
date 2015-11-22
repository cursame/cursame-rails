FactoryGirl.define do
  factory :question do
    content { Faker::Lorem.sentence }
  end
end
