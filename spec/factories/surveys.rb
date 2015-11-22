FactoryGirl.define do
  factory :survey do
    name { Faker::Name.title }
    publish_date Date.today
    end_date Date.today + 3
  end
end
