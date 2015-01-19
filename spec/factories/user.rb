FactoryGirl.define do
  factory :user do
    email 'desarrollo+factory@cursa.me'
    password 'cursameFactory'
    first_name 'Test'
    last_name 'User'
    confirmed_at Time.now
    personal_url 'test-user'
    domain 'cursa.me'
    subdomain { FactoryGirl.create(:network).subdomain }

    factory :user_with_student_role do
      after(:build) do |user| 
        user.permissionings << FactoryGirl.create(:permissioning_with_student_role, user: user, network: Network.last)
      end
    end

    factory :user_with_teacher_role do
      after(:build) do |user| 
        user.permissionings << FactoryGirl.create(:permissioning_with_teacher_role, user: user, network: Network.last)
      end
    end

    factory :user_with_admin_role do
      after(:build) do |user| 
        user.permissionings << FactoryGirl.create(:permissioning_with_admin_role, user: user, network: Network.last)
      end
    end
  end
end
