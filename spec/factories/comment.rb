FactoryGirl.define do
  factory :comment do
    title { Faker::Name.title }
    comment { Faker::Lorem.sentence }
  end
end
