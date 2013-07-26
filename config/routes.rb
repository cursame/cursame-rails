Cursame30Lb::Application.routes.draw do

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


  resources :discussions
###### respuestas a la evaluaciones

  resources :response_to_the_evaluations do
    collection do
      post :create
      post :new
     end
  end


  resources :authentications

  #recursos necesarios para autentificaciones de servicios externos (by alfredot)
  resources :events

  ########## calendar

  get "calendar/index"
  get "calendar/test_calendar"

  ######### dropbox
  get "/connect/dropbox" => "authentications#dropbox", :as => :dropbox
  ######## create
  match "/auth/:provider/callback" => "authentications#create", :as => :providers
  #recursos naturales de la aplicación



  resources :notifications

  resources :compart_assets

  resources :assets

  resources :areas_of_evaluations

  #### manejo de assignments

  resources :assignments


  #### surveys

  resources :surveys

  # colocando miembros en cursos
  resources :members_in_courses

  get "managers/import_courses", :to => "managers#import_courses", :as => :managers_import_courses
  post "managers/import_courses", :to => "managers#upload_courses", :as => :upload_courses

  get "managers/import_members", :to => "managers#import_members", :as => :managers_import_members
  post "managers/import_members", :to => "managers#upload_members", :as => :upload_members

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

# Awaiting_confirmation
  get "awaiting_confirmation/:personal_url", :to => "networks#awaiting_confirmation"

  ##### cambiando el status de un curso
  get "courses/:id/active_status", :to => "courses#active_status", :as =>  :active_status
  ##### listar estatus de los cursos viejos
  get "users/old_courses", :to => "users#old_courses", :as => :user_old_courses
  get "users/acces_courses", :to => "users#acces_courses", :as => :user_acces_courses


  ##### llamadas por ayax rapidas en rails
  get "call_assignments_response/:id", :to => "courses#call_assignments_response", :as => :call_assignments_response
  get "delivery_menu/:id", :to => "courses#delivery_menu", :as => :delivery_menu
  get "course_assignment_l/:id", :to => "courses#course_assignment", :as => :course_assignment_l
  get "course_survey_l/:id", :to => "courses#course_survey", :as => :course_survey_l


  #### llada de ajax de editar tarea

  get "edit_delivery_access/:id", :to => "courses#edit_delivery_access", :as => :edit_delivery_access

  resources :deliveries do
    collection do
      post :assigment
     end
  end
  get "courses/:id/send_mails", :to => "courses#send_mails", :as => :course_send_mails
  match "/courses/sending" => "courses#sending", :as => "sending", :via => [:post]
  #post "courses/:id/send_mails", :to => "courses#send" , :as => :course_send
  match "courses/:id/members", :to => "courses#members", :as => :course_members
  match "courses/:id/deliveries", :to => "deliveries#index", :as => :course_deliveries
  match "courses/:id/deliveries/new", :to => "deliveries#new", :as => :new_course_delivery
  match "courses/:id/dashboard_deliver", :to => "courses#dashboard_deliver"
  match "courses/:id/evaluation", :to => "courses#evaluation", :as => :course_evaluation
  match "courses/:id/_evaluation", :to => "courses#evaluation", :as => :course_evaluation
  match "courses/:id/activities_depot", :to => "courses#activities_depot", :as => :course_activities_depot
  #match "courses/:id/send_mails", :to => "courses#send_mails", :as => :course_send_mails
  get    "deliveries/assigment", :to => "deliveries#assigment",:as => :assigment

  #resources :role_id_and_permission_ids

  #manejo de roles
  resources :roles

  resources :permissions


  #manejo de users

  devise_for :users, :controllers => { :registrations => "registrations" }

  as :user do
    match 'users/sign_out', :to => 'devise/sessions#destroy'
  end

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
  match '/comunity', :to =>  "networks#network_comunity", :as => :network_comunity


  #manejo de usuarios en las networks
  resources :networks_users do
   collection do
    post :create_data
   end
  end

  # manejo de la landing page

  get "home/index"
  get "wall/:id/destroy_wall", :to => "home#destroy_wall", :as => :destroy_wall
  get "comment/:id/destroy_comment", :to => "home#destroy_comment", :as => :destroy_comment
  get "home/authentication", :to => "home#authentications_test",:as => :authentications
  get "edit/:id", :to => "home#edit_wall", :as => :edit_wall

  root :to => 'home#index'

  #comentarios
  match "/home/add_new_comment" => "home#add_new_comment", :as => "add_new_comment", :via => [:post]

  #finish tour
  match "/home/finish_tour" => "home#finish_tour", :as => "finish_tour", :via => [:get]


  #cargas mas comentarios
  match  "home/load_more_comments/:id", :to => "home#load_more_comments", :as => :load_more_comments

  #surveys
  match "/surveys/survey_reply" => "surveys#survey_reply", :as => "add_survey_reply", :via => [:post]

  #permisioning
  match "/permissionings/update", :to => "permissionings#update", :as => "permisioning", :via => [:post]

  #machando las relaciones de creación de eventos para delivery, survey

  resources :surveys do
    resources :events
  end

  resources :deliveries do
    resources :events
  end

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
  # -----------------------------
  # chat behaviour of cursame
  # -----------------------------
  get "home/chat", :to => "home#chat", :as => :chat
  get "home/load_more_messages/:id", :to => 'home#load_more_messages', :as => :load_more_messages
  get "home/open_channel/:id", :to => 'home#open_channel', :as => :open_channel
  match "/home/add_new_mesage" => "home#add_new_mesage", :as => "add_new_mesage", :via => [:post]
  #--------------
  #NOTIFICATIONS
  #---------------
  get "home/load_more_notfications", :to => 'home#load_more_notfications', :as => :load_more_notfications

  ####### rutas de estandarizacion de eventos

  match 'focus/:id', :to => 'events#show', :as => :eventuable

  ####### ruta para creacion de timeline

   get 'courses/:id/course_ki_line', :to => 'courses#course_ki_line', :as => :course_ki_line

   ###### ruta para crear super admins

   match "canguro/admin/protocol/l4789471797l9392342lh3jijisfij3liii14adnainvftldlqnnifnai", :to => "superadmnin#create_super_admin", :as => :super_admin_create
   match "instructions_for_super_admin", :to => "superadmnin#instructions", :as => :super_admin_instructions

   ######## contenido
    get "content/youtube", :as => :c_youtube

    get "content/vimeo"

    get "content/wikipedia", :as => :c_wikipedia

    get "content/orkut"

    get "content/khanacademy"
    
  
  ####### parents
   # get "home/parents", :as => :parents
   # get "home/my_son", :as => :my_son
   # get "home/acces_on_course", :as => :acces_on_course

  #paginas de errores
  match '/404', :to => 'home#not_found'
  match '/422', :to => 'home#server_error'
  match '/500', :to => 'home#server_error'

   # api para la mobile
   #this is for api for the mobile app
  namespace :api do
    resources :tokens,:only => [:create, :destroy]
  end
  match '/api/tokens/create', :to => 'api/tokens#create', :as => :login
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
end
