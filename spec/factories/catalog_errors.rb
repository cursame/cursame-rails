FactoryGirl.define do
  factory :catalog_error do
    row { Faker::Number.number(2).to_i }
    email { Faker::Internet.email }
    errors_message { Faker::Lorem.characters(30) }
    field 'permissionings'
  end
end
