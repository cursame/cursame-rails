FactoryGirl.define do
  factory :network do
    name { Faker::Name.name }
    subdomain 'testing'
    population { Faker::Number.number 3 }
    register_form true
  end
end
