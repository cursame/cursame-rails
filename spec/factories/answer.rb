FactoryGirl.define do
  factory :answer do
    content { Faker::Lorem.sentence }
  end
end
