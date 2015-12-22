authorization do

  role :shared do
    has_permission_on [:comments], to: [:manage]
    has_permission_on [:users], to: [:manage]
    has_permission_on [:calendar], to: [:manage]
    has_permission_on [:assets], to: [:manage]
    has_permission_on [:discussions], to: [:manage]
    has_permission_on [:library_files], to: [:create]
  end

  role :student do
    includes :shared

    has_permission_on [:roles], to: [:create, :delete, :update, :users, :show]
    has_permission_on [:courses], to: [:read]
    has_permission_on [:delivery], to: [:read]
    has_permission_on [:assigments], to: [:manage]
    has_permission_on [:events], to: [:manage]
  end

  role :teacher do
    includes :shared

    has_permission_on [:roles], to: [:manage]
    has_permission_on [:courses], to: [:manage, :members]
    has_permission_on [:deliveries], to: [:manage]

    has_permission_on [:forms], to: [:create]
    has_permission_on [:surveys], to: [:manage, :survey_add_attemp]

    has_permission_on [:library_files], to: [:delete]
  end

  role :operator do
    includes :teacher
  end


  role :admin do
    includes :teacher

    has_permission_on [:events], to: [:manage]

    has_permission_on [:managers], to: [
      :index,
      :publications,
      :settings,
      :import_members,
      :upload_members,
      :mailer,
      :mailer_deliver,
      :network_mailer_user_list,
      :network_mailer_student_list,
      :network_mailer_teacher_list,
      :network_mailer_list_deliver,
      :course_mailer,
      :course_mailer_deliver,
      :course_mailer_list,
      :course_mailer_list_deliver
    ]
    has_permission_on [:managers_users], to: [:manage, :new, :import, :import_receiver]
    has_permission_on [:managers_courses], to: [:manage, :new, :import, :import_receiver]
    has_permission_on [:managers_deliveries], to: [:read, :delete]
    has_permission_on [:managers_surveys], to: [:read, :delete]
    has_permission_on [:managers_discussions], to: [:read, :delete]
    has_permission_on [:managers_comments], to: [:read, :delete]

    has_permission_on [:managers_reported_contents], to: [:read, :delete, :destroy_content]
    has_permission_on [:managers_bit_courses], :to => [:read, :import]

    has_permission_on [:library_files], to: [:delete]
  end

  role :superadmin do
    includes :admin

    has_permission_on [:superadmnin], to: [
      :statistics,
      :networks,
      :users,
      :activities,
      :roles,
      :create_super_admin,
      :courses_sintetic_view_and_edit,
      :publicity_modul_controller,
      :instructions,
    ]
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]

  privilege :read, :includes => [:index, :show, :users]
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
