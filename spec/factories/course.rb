FactoryGirl.define do

  factory :course do
    title { Faker::Name.title }
    silabus { Faker::Lorem.paragraph }
    init_date Date.today
    active_status true
  end
end
