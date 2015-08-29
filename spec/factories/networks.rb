FactoryGirl.define do
  factory :network do
    name { Faker::Name.name }
    subdomain 'testing'
    population { Faker::Number.number 3 }
    register_form true
    welcom_message { Faker::Name.last_name }
    language I18n.default_locale.to_s
  end
end
