FactoryGirl.define do
  factory :permissioning do
    factory :permissioning_with_admin_role do
      role_id 1
    end
    factory :permissioning_with_student_role do
      role_id 2
    end
    factory :permissioning_with_teacher_role do
      role_id 3
    end
  end
end