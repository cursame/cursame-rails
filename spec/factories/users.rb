FactoryGirl.define do

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    domain 'lvh.me'
    subdomain 'testing'
    personal_url { Faker::Lorem.characters(30) }
    confirmed_at { Time.now }

    transient do
      role "student"
    end

    after(:create) do |user, attributtes|

      network = Network.find_by_subdomain(user.subdomain)

      if attributtes.role == "mentor_link"
        entity_id = Faker::Number.number(2)
        entity_name = Faker::Lorem.word
      end

      role = Role.find_by_title(attributtes.role)
      create :permissioning, role: role, network: network, user: user,
             entity_id: entity_id, entity_name: entity_name
    end
  end
end
