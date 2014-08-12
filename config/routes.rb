# -*- coding: utf-8 -*-
Cursame30Lb::Application.routes.draw do

  get "load_layout/load_wall"

  get "load_layout/load_post_menu"

  get "load_layout/load_sidebar"

  get "load_layout/load_chat"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :usernotificationings
  resources :members_in_groups
  resources :groups
  resources :libraries
  resources :settings_teachers
  resources :polls
  resources :messages

  get "superadmnin/statistics"
  get "superadmnin/networks"
  get "superadmnin/users"
  get "superadmnin/activities"
  get "superadmnin/roles"
  get "superadmnin/create_super_admin"
  get "superadmnin/courses_sintetic_view_and_edit"
  get "superadmnin/publicity_modul_controller"

  ###### configuración de managers de la red
  get "managers/wall"
  get "managers/members"
  get "managers/network_configuration"
  get "managers/library"
  get "managers/delete_user", :as => :delete_user

  ##### respuestas a la evaluaciones
  resources :response_to_the_evaluations do
    collection do
      post :create
      post :new
    end
  end

  resources :authentications

  ########## calendar
  get "calendar", :to => 'calendar#index', :as => :calendar
  get "calendar/test_calendar"
  get "activities_for_today", :to => 'calendar#activities_for_today', :as => :activities_for_today


  ######### dropbox
  get "/connect/dropbox" => "authentications#dropbox", :as => :dropbox
  ######## create
  match "/auth/:provider/callback" => "authentications#create", :as => :providers
  match 'auth/failure', to: redirect('/')

  #recursos naturales de la aplicación
  resources :notifications
  resources :assets

  #### manejo de assignments

  resources :assignments

  # colocando miembros en cursos
  resources :members_in_courses

  get '/update_mc', :to => 'members_in_courses#update'
  # colocando course files
  resources :course_files, :as => :course_files, :defaults => { :format => 'js' }
  # metodos de manejo de cursos
  get "managers/import_courses", :to => "managers#import_courses", :as => :managers_import_courses
  post "managers/import_courses", :to => "managers#upload_courses", :as => :upload_courses

  get "managers/import_members", :to => "managers#import_members", :as => :managers_import_members
  post "managers/import_members", :to => "managers#upload_members", :as => :upload_members

  #Calificar Actividades
  get '/evaluate', :to => 'evaluate#index', :as => :evaluate_activities
  get '/evaluate/inactive', :to => 'evaluate#inactive', :as => :evaluate_activities_inactive
  get '/evaluate/courses/:id', :to => 'evaluate#course', :as => :evaluate_course
  get '/evaluate/courses/:id/inactive', :to => 'evaluate#course_inactive', :as => :evaluate_course_inactive

  get '/evaluate/survey/:survey_id', :to => 'evaluate#qualifying', :as => :evaluate_survey
  get '/evaluate/survey/response/:id', :to => 'evaluate#user_survey', :as => :evaluate_survey_response
  post '/evaluate/survey/response/:id/update', :to => 'evaluate#response_user_survey', :as => :evaluate_survey_response_update

  get '/evaluate/delivery/:delivery_id', :to => 'evaluate#qualifying', :as => :evaluate_delivery
  get '/evaluate/assignment/:id', :to => 'evaluate#assignment', :as => :evaluate_delivery_response

  get '/evaluate/discussion/:discussion_id', :to => 'evaluate#discussion', :as => :evaluate_discussion
  get '/evaluate/discussion-response/:id', :to => 'evaluate#discussion_response', :as => :evaluate_discussion_response

  # Tareas
  get "/deliveries", to: "deliveries#index", as: :deliveries
  get "/deliveries/lapsed", to: "deliveries#lapsed", as: :deliveries_lapsed
  get '/courses/:id/deliveries/', to: 'deliveries#deliveries_course', as: :deliveries_course
  get "/courses/:id/deliveries/lapsed", to: "deliveries#deliveries_course_lapsed", as: :deliveries_course_lapsed
  get '/deliveries/paginate-ajax', to: "deliveries#paginate_ajax", as: :deliveries_paginate_ajax

  # Surveys
  get "surveys", :to => 'surveys#index', :as => :surveys
  get "surveys/lapsed", :to => 'surveys#lapsed', :as => :surveys_lapsed
  get '/courses/:id/surveys/', to: 'surveys#surveys_course', as: :surveys_course
  get "/courses/:id/surveys/lapsed", to: "surveys#surveys_course_lapsed", as: :surveys_course_lapsed
  match "/surveys/survey_reply" => "surveys#survey_reply", :as => "add_survey_reply", :via => [:post]
  get '/surveys/paginate-ajax', to: "surveys#paginate_ajax", as: :surveys_paginate_ajax
  resources :surveys

  # Discusiones
  get '/courses/:id/discussions/', to: 'discussions#discussions_course', as: :discussions_course
  get '/discussions/paginate-ajax', to: "discussions#paginate_ajax", as: :discussions_paginate_ajax
  resources :discussions

  # Cursos
  get '/courses/pending', :to => 'courses#pending', :as => :courses_pending
  get '/courses/all', :to => 'courses#all', :as => :courses_all
  get '/courses/unpublished', :to => 'courses#unpublished', :as => :courses_unpublished
  get '/courses/paginate-ajax', to: "courses#paginate_ajax", as: :courses_paginate_ajax
  match '/courses/search', :to => "courses#search", :as => :search_courses
  get '/courses/:id/about', :to => 'courses#about', :as => :about_course
  get '/courses/:id/library', :to =>  'courses#library', :as => :library_in_course
  get '/courses/:id/library_pagination', :to =>  'courses#library_pagination', :as => :library_in_course_pagination
  get '/courses/:id/evaluation-schema', :to =>  'courses#evaluation_schema', :as => :course_evaluation_schema

  resources :courses do
    resources :assignments
    resources :messages do
      collection do
        post :active_create
      end
    end

    collection do
      post :assigment
    end
  end
  
  # metodos de amplio acceso al curso
  get 'courses/:id/statistics', :to => 'courses#statistics', :as => :statistics_in_course

  # Awaiting_confirmation
  get "awaiting_confirmation/:user_id", :to => "networks#awaiting_confirmation"

  ##### cambiando el status de un curso
  get "courses/:id/active_status", :to => "courses#active_status", :as =>  :active_status
  ##### clonar curso

  get "courses/:id/clone_course_view", :to => "courses#clone_course_view", :as =>  :clone_course_view
  match "courses/:id/clone_course", :to => "courses#clone_course", :as =>  :clone_course, :via => [:post]

  ##### listar estatus de los cursos viejos
  get "users/old_courses", :to => "users#old_courses", :as => :user_old_courses
  get "users/acces_courses", :to => "users#acces_courses", :as => :user_acces_courses

  #### tour virtual
  get "tour_reciver", :to => "users#tour_reciver", :as => :tour_reciver
  #### lista calificaciones

  get "/califications", :to => "users#califications", :as =>  :califications

  #### destroy user
  get "users/destroy_user_with_parts/:id", :to => "users#destroy_user_with_parts", :as => :destroy_user_with_parts


  ##### llamadas por ayax rapidas en rails
  get "call_assignments_response/:id", :to => "courses#call_assignments_response", :as => :call_assignments_response
  get "delivery_menu/:id", :to => "courses#delivery_menu", :as => :delivery_menu
  get "course_assignment_l/:id", :to => "courses#course_assignment", :as => :course_assignment_l
  get "course_assignment_l_notif/:id", :to => "courses#course_assignment_notif", :as => :course_assignment_l_notif
  get "course_survey_l/:id", :to => "courses#course_survey", :as => :course_survey_l
  get "course_survey_l_notif/:id", :to => "courses#course_survey_notif", :as => :course_survey_l_notif

  ##### llamadas por ayax rapidas en rails para el activities depot
  get "course_delivery_actdepot/:id", :to => "courses#course_delivery_actdepot", :as => :course_delivery_actdepot
  get "course_survey_actdepot/:id", :to => "courses#course_survey_actdepot", :as => :course_survey_actdepot

  ##### llamada ajax para saber si la session ha expirado

  get "expire_session", :to => "networks#expire_session", :as => :expire_session


  #### llada de ajax de editar tarea

  get "edit_delivery_access/:id", :to => "courses#edit_delivery_access", :as => :edit_delivery_access

  resources :deliveries do
    collection do
      post :assigment
    end
  end

  get 'assignments/delivery_responce'
  ################ llamada para republicar tarea  y  cuestionario ################
  get'/publish_unpublish_delivery_manualy', :to => 'deliveries#publish_unpublish_delivery_manualy', :as => :publish_unpublish_delivery_manualy
  get'/publish_unpublish_survey_manualy', :to => 'surveys#publish_unpublish_survey_manualy', :as => :publish_unpublish_survey_manualy

  ##### coureses coment

  get "courses/:id/send_mails", :to => "courses#send_mails", :as => :course_send_mails
  match "/courses/sending" => "courses#sending", :as => "sending", :via => [:post]
  #post "courses/:id/send_mails", :to => "courses#send" , :as => :course_send
  match "courses/:id/members", :to => "courses#members", :as => :course_members
  match "courses/:id/deliveries/new", :to => "deliveries#new", :as => :new_course_delivery
  match "courses/:id/dashboard_deliver", :to => "courses#dashboard_deliver"
  match "courses/:id/evaluation_download", :to => "courses#evaluation_download", :as => :course_evaluation_download
  match "courses/:id/_evaluation", :to => "courses#evaluation", :as => :course_evaluation
  match "courses/:id/activities_depot", :to => "courses#activities_depot", :as => :course_activities_depot
  #match "courses/:id/send_mails", :to => "courses#send_mails", :as => :course_send_mails
  get    "deliveries/assigment", :to => "deliveries#assigment",:as => :assigment

  #resources :role_id_and_permission_ids

  #manejo de roles
  resources :roles

  resources :permissions


  #manejo de users
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "usessions", :omniauth_callbacks => "omniauth_callbacks" }
  ActiveAdmin.routes(self)

  as :user do
    match 'users/sign_out', :to => 'usessions#destroy', :as => :sign_out
    match 'users/sign_in', :to =>  'usessions#new', :as => :sign_in
    match 'teachers/sign_up' => 'registrations#new' 
  end

  #### finalizador de sesiones
  get '/ending_session', :to =>  'home#ending_session', :as => :ending_session
  get '/alertmethod', :to => 'networks#alertmethod', :as => :alertmethod
  #get '/session_conserve', :to => 'networks#session_conserve', :as => :session_conserve


  ###### users personal_url_validation

  get '/personlization_url_corroborate/:personal_url', :to => 'users#corroborate_url', :as => :corroborate_url

  ###### users tabs

  get '/users/:personal_url/info', :to => 'users#info', :as => :user_info
  get '/users/:personal_url/friends', :to => 'users#friends', :as => :user_friends
  get '/users/:personal_url/courses', :to => 'users#courses', :as => :user_courses
  get '/users/:personal_url/pendding_friends', :to => 'users#pendding_friends', :as => :pendding_friends
  
  # Groups
  get "users/:personal_url/groups/" => "groups#show", :as => :show_groups
  post "users/:personal_url/groups/create" => "groups#create", :as => :create_group
  get "users/:personal_url/groups/new" => "groups#new", :as => :new_group
  get "users/:personal_url/groups/:id/edit" => "groups#edit", :as => :edit_group
  post "user/:personal_url/groups/:id/update" => "groups#update", :as => :update_group
  delete "user/:personal_url/groups/destroy" => "groups#destroy", :as => :delete_group

  #Member_in_groups
  post "user/:personal_url/groups/add_member" => "members_in_groups#create", :as => :add_member_in_group
  delete "user/:personal_url/groups/delete_member" => "members_in_groups#destroy", :as => :delete_member_in_group

  # import csv de usuarios
  get "managers/import_users" => "managers#import_users", :as => :managers_import_users
  get "managers/send_mails" => "managers#send_mails", :as => :massive_mails
  match "managers/sending" => "managers#sending", :as => "massive_sending", :via => [:post]
  post "/managers/upload_users" => "managers#upload_users", :as => :upload_users

  post "/user/upload_users_a" => "users#upload_users_a", :as => :upload_users_a


  get  "/users/:personal_url", :to => "users#show",  :as =>  :show_user
  match  "/users/", :to => "users#index",  :as =>  :users
  match  "/users/:personal_url/dashboard", :to => "users#dashboard", :as => :network_selector

  # confirme user
  post "users/confirm" => "users#confirm", :as => :user_confirm
  # change password
  post "users/set_password" => "users#set_password", :as => :set_password

  #friends
  #resources :user_friends
  get  "users/:personal_url/friends" => "friendships#show", :as => :show_friends
  get  "users/:personal_url/friends/new" =>  "friendships#new", :as => :new_friends
  post "user/:personal_url/friends/new" => "friendships#create"
  post "user/:personal_url/friends" => "friendships#update"
  delete "user/:personal_url/friends" => "friendships#destroy"
  #match  "users/:user_id/waiting_friends/:id", :to => "users#sufriend", :as => :show_user_friends
  #match  "users/:user_id/waiting_friends", :to => "users#waiting_friends", :as => :user_waiting_friends
  get "users/:user_id/coverphoto", :to => "users#coverphoto", :as => "cover_photo"


  get "community/:id/new", :to => "friendships#create_friend", :as => :friendships_create_friend
  get "community/:id/update", :to => "friendships#update_friend", :as => :friendships_update_friend
  get "community/:id/destroy", :to => "friendships#destroy", :as => :friendships_destroy_friend

  #roles
  match  "/admin_roles", :to => "roles#users",  :as =>  :user_roles

  #manejo de networks
  match 'networks/networkregistration/protocol-iscander', :to => 'networks#network_mask', :as => :registration_mask
  get "networks_users/create"

  get "networks_users/new"

  match "networks_users/index", :to => "networks#register", :at => :networks_user

  resources :network_templates

  resources :networks
  match '/' => 'networks#show', :constraints => { :subdomain => /.+/ },  :as =>  :wall

  # Comunidad
  get '/community', to: "community#all", as: :network_comunity
  get '/community/students', to: "community#students", as: :community_students
  get '/community/teachers', to: "community#teachers", as: :community_teachers
  post '/community/search', to: "community#search", as: :community_search
  get '/community/paginate-ajax', to: "community#paginate_ajax", as: :community_paginate_ajax

  # filtro del wall
  get 'wall_filter', :to => 'networks#wall_filter', :as => :wall_filter
  #manejo de usuarios en las networks
  resources :networks_users do
    collection do
      post :create_data
    end
  end

  # manejo de la landing page

  get "home/index"
  get "/", :to => "home#landing_page", :as => :landing_page
  get "/terms-conditions", :to => "home#conditions", :as => :conditions
  get "/privacidad", :to => "home#privacidad", :as => :privacidad
  get "/blog", :to => "home#blog", :as => :blog
  get "/help", :to => "home#help", :as => :help
  get "wall/:id/destroy_wall", :to => "home#destroy_wall", :as => :destroy_wall
  get "comment/:id/destroy_comment", :to => "home#destroy_comment", :as => :destroy_comment
  get "home/authentication", :to => "home#authentications_test",:as => :authentications
  get "edit/:id", :to => "home#edit_wall", :as => :edit_wall

  get "/features", :to => "home#features", :as => :features
  get "/press", :to => "home#press", :as => :press
  get "/jobs", :to => "home#jobs", :as => :jobs
  get "/contact", :to => "home#contact", :as => :contact
  get "/apps", :to => "home#apps", :as => :apps
  get "/request-demo", :to => "home#request_demo", :as => :request_demo
  get "/success-stories", :to => "home#success_stories", :as => :success_stories
  get "/success-stories", :to => "home#success_stories", :as => :success_stories
  get "/teacher-day", :to => "home#teacher_day", :as => :teacher_day
  get "/about", :to => "home#about_us", :as => :about_us

  get "/mkt/thanks", :to => "home#mkt_thanks", :as => 'mkt_thanks'
  get "/mkt/:name", :to => "home#mkt"

  #para inicar sesion
  match '/new_sesion_from_home', to: 'home#new_sesion_from_home', via: 'post', :as => :new_sesion_from_home, :defaults => { :format => 'html' }
  #para el formulario de contacto
  match '/contact_mail', to: 'home#send_contact_mail', via: 'post', :as => :send_contact_mail, :defaults => { :format => 'js' }

  root :to => 'home#index'

  # Overlays
  match '/modals/network_intro_video', to: 'modal#network_intro_video_modal', :as => :network_intro_video_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/set_password', to: 'modal#set_password_modal', :as => :set_password_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/teacher_quiz', to: 'modal#teacher_quiz_modal', :as => :teacher_quiz_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/student_quiz', to: 'modal#student_quiz_modal', :as => :student_quiz_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/landing_intro_video', to: 'modal#landing_intro_video_modal', :as => :landing_intro_video_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/delivery/:id', to: 'modal#delivery_modal', :as => :delivery_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/survey/:id', to: 'modal#survey_modal', :as => :survey_modal, :via => [:get], :defaults => { :format => 'js' }
  match '/modals/discussion/:id', to: 'modal#discussion_modal', :as => :discussion_modal, :via => [:get], :defaults => { :format => 'js' }

  #comentarios
  match "/home/add_new_comment" => "home#add_new_comment", :as => "add_new_comment", :via => [:post], :defaults => { :format => 'js' }

  #finish tour
  match "/home/finish_tour" => "home#finish_tour", :as => "finish_tour", :via => [:get]

  #quien le dio like a una publicacion del wall
  get "home/get_votes_of_publication/:id", :to => "home#get_votes_of_publication", :as => :get_votes_of_publication

  #cargas mas comentarios
  match  "home/load_more_comments/:id", :to => "home#load_more_comments", :as => :load_more_comments

  #permisioning
  match "/permissionings/update", :to => "permissionings#update", :as => "permisioning", :via => [:post]
  get "/permissionings/unactive_user", :to => "permissionings#unactive_user", :as => "unactive_user", :via => [:post]

  # subiendo permisos en manager
  #match 'managers/permissioning/:id',  :to =>"managers#permissioning", :as => :permissioning
  #match 'managers/permissioning_for_manager/roles/:id',:to => "managers#permissioning_for_manager", :as => :permissioning_for_manager

  #resources :permissionings

  resources :managers do
    #resources :permissionings
    resources :roles
  end

  ####### subiendo validables with geocoder activities #########
  resources :activities

  resources :surveys do
    resources :activities
  end

  resources :deliveries do
    resources :activities
  end

  resources :assignments do
    resources :activities
  end

  resources :comments do
    resources :activities
  end

  resources :discussions do
    resources :activities
  end

  resources :courses do
    resources :activities
  end

  resources :user_surveys do
    resources :activities
  end


  ######## rutas para contents

  resources :contents

  resources :surveys do
    resources :contents
  end

  resources :deliveries do
    resources :contents
  end

  resources :assignments do
    resources :contents
  end

  resources :comments do
    resources :contents
  end

  resources :discussions do
    resources :contents
  end

  resources :courses do
    resources :contents
  end

  resources :user_surveys do
    resources :contents
  end
  ####### rutas para like en web

  get "/upvote/:id", :to => 'home#upvote', :as => :upvote
  get "/downvote/:id", :to => 'home#downvote', :as => :downvote
  get "/upvote_comment/:id", :to => 'home#upvote_comment', :as => :upvote_comment
  get "/downvote_comment/:id", :to => 'home#downvote_comment', :as => :downvote_comment

  ####### actualizacion de noticicacion

  get "home/editing_n", :to => "home#editing_n", :as => :not_edit

  get "home/render_notifications", :to => "home#render_notifications", :as => :render_notifications

  ####### envio de mail masivo con notificaciones
  get "/masive_mailer", :to => "superadmnin#masive_mailer", :as => :masive_mailer, :defaults => { :format => 'js' }
  # -----------------------------
  # chat behaviour of cursame
  # -----------------------------
  get "home/chat", :to => "home#chat", :as => :chat
  get "home/load_more_messages/:id", :to => 'home#load_more_messages', :as => :load_more_messages
  get "home/open_channel/:id", :to => 'home#open_channel', :as => :open_channel
  match "/home/add_new_mesage" => "home#add_new_mesage", :as => "add_new_mesage", :via => [:post]

  get "/update_wufoo_form", :to => "home#update_wufoo_form", :as => :update_wufoo_form
  #--------------
  #NOTIFICATIONS
  #---------------
  get "home/load_more_notfications", :to => 'home#load_more_notfications', :as => :load_more_notfications

  get 'courses/:id/course_ki_line', :to => 'courses#course_ki_line', :as => :course_ki_line


  ###### ruta para creacion de timeline paginada
  get 'courses/:id/course_ki_line_pag', :to => 'courses#course_ki_line_pag', :as => :course_ki_line_pag

  ###### carga mas actividades
  get "courses/:id/load_more_activities", :to => 'courses#load_more_activities', :as => :load_more_activities

  ###### ruta para crear super admins

  match "canguro/admin/protocol/l4789471797l9392342lh3jijisfij3liii14adnainvftldlqnnifnai", :to => "superadmnin#create_super_admin", :as => :super_admin_create
  match "instructions_for_super_admin", :to => "superadmnin#instructions", :as => :super_admin_instructions

  get "content/destroy/:id", :to =>  'content#destroy', :as => :destroy_content
  ##### cierra la base de datos

  get '/closer_db', :to => 'home#closer_db', :as => :clorse_db
  ##### obtines las bases para busqueda de networks
  get '/network_search', :to => 'networks#network_search', :as => :network_search
  ####### parents
  get '/acces_t/:key_analytics', :to => 'parents#info_to_parents', :as => :info_to_parents
  get '/inc_activity', :to => 'parents#inc_activity', :as => :inc_activity
  get '/general_prm', :to => 'parents#general_prm', :as => :inc_activity
  get '/acces_course_for_render', :to => 'parents#acces_course', :as => :acces_course_for_render
  # get "home/parents", :as => :parents
  # get "home/my_son", :as => :my_son
  # get "home/acces_on_course", :as => :acces_on_course
  #
  get '/publications/:id/show_template_on_modal', :to => 'publications#show_template_on_modal', :as => :show_template_on_modal , :defaults => { :format => 'js' }

  #paginas de errores
  match '/404', :to => 'home#not_found', :as => :not_found
  match '/422', :to => 'home#server_error'
  match '/500', :to => 'home#server_error'
  match '/503', :to => 'home#server_error'
  # api para la mobile
  #this is for api for the mobile app
  namespace :api do
    resources :tokens,:only => [:create, :destroy]
  end
  match '/api/tokens/create', :to => 'api/tokens#create', :as => :login
  match '/api/tokens/destroy', :to => 'api/tokens#destroy', :as => :logout
  match '/api/tokens/native_create_user', :to => 'api/tokens#native_create_user', :as => :native_create_user_json

  match '/api/api/publications', :to => 'api/api#publications', :as => :publicationsjson
  match '/api/api/comments', :to => 'api/api#comments', :as => :commentsjson
  match '/api/api/courses', :to => 'api/api#courses', :as => :coursesjson
  match '/api/api/users', :to => 'api/api#users', :as => :usersjson
  match '/api/api/notifications', :to => 'api/api#notifications', :as => :notificationsjson
  match '/api/api/create_comment', :to => 'api/api#create_comment', :as => :create_comment
  match '/api/api/create_like', :to => 'api/api#create_like', :as => :create_like
  match '/api/api/create_delivery', :to => 'api/api#create_delivery', :as => :create_delivery
  match '/api/api/create_discussion', :to => 'api/api#create_discussion', :as => :create_discussion
  match '/api/api/delete', :to => 'api/api#delete', :as => :delete
  match '/api/api/assignments', :to => 'api/api#assignments', :as => :assignments
  match '/api/api/assigment_delivery', :to => 'api/api#assigment_delivery', :as => :assigment_delivery
  match '/api/api/qualify_assignment', :to => 'api/api#qualify_assignment', :as => :qualify_assignment

  # api para nativa
  match '/api/api/native_publications', :to => 'api/api#native_publications', :as => :native_publications_json
  match '/api/api/native_create_delivery', :to => 'api/api#native_create_delivery', :as => :native_create_delivery_json
  match '/api/api/native_assigment_delivery', :to => 'api/api#native_assigment_delivery', :as => :native_assigment_delivery_json
  match '/api/api/native_create_survey', :to => 'api/api#native_create_survey', :as => :native_create_survey_json
  match '/api/api/native_change_notification_status', :to => 'api/api#native_change_notification_status', :as => :native_change_notification_status_json
  match '/api/api/native_update_user_profile', :to => 'api/api#native_update_user_profile', :as => :native_update_user_profile_json
  match '/api/api/native_create_courses', :to => 'api/api#native_create_courses', :as => :native_create_courses_json
  match '/api/api/native_answer_survey', :to => 'api/api#native_answer_survey', :as => :native_answer_survey_json
  match '/api/api/native_comments', :to => 'api/api#native_comments', :as => :native_comments_json
  match '/api/api/native_list_members_in_course', :to => 'api/api#native_list_members_in_course', :as => :native_list_members_in_course_json
  match '/api/api/native_change_members_in_course_status', :to => 'api/api#native_change_members_in_course_status', :as => :native_change_members_in_course_status_json
  match '/api/api/native_add_new_message', :to => 'api/api#native_add_new_message', :as => :native_add_new_message_json
  match '/api/api/native_chat_list', :to => 'api/api#native_chat_list', :as => :native_chat_list_json
  match '/api/api/native_load_chat_messages', :to => 'api/api#native_load_chat_messages', :as => :native_load_chat_messages_json

  match '/api/api/native_list_user_calification', :to => 'api/api#native_list_user_calification', :as => :native_list_user_calification_json
  match '/api/api/native_list_events', :to => 'api/api#native_list_events', :as => :native_list_events_json
  match '/api/api/native_list_activities_of_course', :to => 'api/api#native_list_activities_of_course', :as => :native_list_activities_of_course_json
  match '/api/api/native_list_networks', :to => 'api/api#native_list_networks', :as => :native_list_networks_json

  # friendships
  match '/api/api/friend_request', :to => 'api/api#friend_request', :as => :friend_request_json
  match '/api/api/friend_accept', :to => 'api/api#friend_accept', :as => :friend_accept_json
  match '/api/api/friend_remove', :to => 'api/api#friend_remove', :as => :friend_remove_json

  #logout
  match "/home/logout_user" => "home#logout_user", :as => "logout_user", :via => [:post]

  match '/robots' => 'robots#robots'

end
