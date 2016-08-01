FactoryGirl.define do
  factory :library_directory do
    name { Faker::Name.title }
    description { Faker::Lorem.paragraph }
  end
end
