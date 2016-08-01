FactoryGirl.define do
  factory :google_form do
    title { Faker::Name.title }
    description { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    init_date Date.today
    term_date Date.today + 3
  end
end
