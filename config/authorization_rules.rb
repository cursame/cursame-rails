authorization do

  role :admin do
    has_permission_on [:roles], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:courses], to: [:users,:create,:destroy,:index,:show,:edit,:members]
    has_permission_on [:deliveries], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:comments], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:users], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:calendar], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assets], to: [:users,:crea_e,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:surveys], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:forms], to: [:create]
    has_permission_on [:events], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:library_files], to: [:create]

    has_permission_on [:managers], :to => [ :index, :publications, :settings, :import_members, :upload_members, :mailer, :mailer_deliver ]
    has_permission_on [:managers_users], :to => [ :index, :show, :new, :create, :edit, :update, :destroy, :import, :import_receiver ]
    has_permission_on [:managers_courses], :to => [ :index, :show, :new, :create, :update, :edit, :destroy, :import, :import_receiver ]
    has_permission_on [:managers_deliveries], :to => [ :index, :show, :destroy ]
    has_permission_on [:managers_surveys], :to => [ :index, :show, :destroy ]
    has_permission_on [:managers_discussions], :to => [ :index, :show, :destroy ]
    has_permission_on [:managers_comments], :to => [ :index, :show, :destroy ]
    has_permission_on [:managers_reported_contents], :to => [ :index, :show, :destroy, :destroy_content ]
    has_permission_on [:managers_bit_courses], :to => [:index, :show, :import]
  end

  role :student do
    has_permission_on [:roles], to: [:users,:create,:destroy,:show,:edit]
    has_permission_on [:courses], to: [:users,:index,:show]
    has_permission_on [:delivery], to: [:show]
    has_permission_on [:comments], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:users], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:calendar], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assets], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assigments], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:events], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:library_files], to: [:create]
  end

  role :teacher do
    has_permission_on [:roles], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:courses], to: [:users,:create,:destroy,:index,:show,:edit,:members]
    has_permission_on [:deliveries], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:comments], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:users], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:calendar], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assets], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:forms], to: [:create]
    has_permission_on [:surveys], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:library_files], to: [:create]
  end


  role :superadmin do
    has_permission_on [:roles], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:courses], to: [:users,:create,:destroy,:index,:show,:edit,:members]
    has_permission_on [:deliveries], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:comments], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:users], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:calendar], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assets], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:surveys], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:forms], to: [:create]
    has_permission_on [:events], to: [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:library_files], to: [:create]

    has_permission_on [:managers], to: [ :index, :publications, :settings, :import_members, :upload_members, :mailer, :mailer_deliver ]
    has_permission_on [:managers_users], to: [ :index, :show, :new, :create, :edit, :update, :destroy, :import, :import_receiver ]
    has_permission_on [:managers_courses], to: [ :index, :show, :new, :create, :update, :edit, :destroy, :import, :import_receiver ]
    has_permission_on [:managers_deliveries], to: [ :index, :show, :destroy ]
    has_permission_on [:managers_surveys], to: [ :index, :show, :destroy ]
    has_permission_on [:managers_discussions], to: [ :index, :show, :destroy ]
    has_permission_on [:managers_comments], to: [ :index, :show, :destroy ]

    has_permission_on [:superadmnin], to: [:statistics, :networks, :users, :activities,
      :roles, :create_super_admin, :courses_sintetic_view_and_edit, :publicity_modul_controller,
      :instructions]
    has_permission_on [:managers_reported_contents], :to => [ :index, :show, :destroy, :destroy_content ]
  end
end
