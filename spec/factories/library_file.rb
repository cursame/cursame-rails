include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :library_file do
    file { fixture_file_upload(Rails.root.to_s + '/spec/fixtures/files/images/palm.png', 'image/png') }
    name { Faker::Name.title }
    description { Faker::Lorem.paragraph }
  end
end
