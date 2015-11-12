FactoryGirl.define do
  factory :discussion do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    publish_date Date.today
    end_date Date.today + 3
  end
end
