# -*- coding: utf-8 -*-
Cursame30Lb::Application.routes.draw do

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

  #recursos necesarios para el calendario
  resources :events

  get "calendar/index"
  get "calendar/test_calendar"

  match "/auth/:provider/callback" => "authentications#create"


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

  get "courses/import", :to => "courses#import", :as => :import

  resources :courses do
    collection do
      post :upload_csv
    end
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

  ##### cambiando el status de un curso
  get "courses/:id/active_status", :to => "courses#active_status", :as =>  :active_status
  ##### listar estatus de los cursos viejos
  get "users/old_courses", :to => "users#old_courses", :as => :user_old_courses
  get "users/acces_courses", :to => "users#acces_courses", :as => :user_acces_courses

  ##### llamadas por ayax rapidas en rails
  get "call_assignments_response/:id", :to => "courses#call_assignments_response", :as => :call_assignments_response
  get "delivery_menu/:id", :to => "courses#delivery_menu", :as => :delivery_menu

  #### llada de ajax de editar tarea

  get "edit_delivery_access/:id", :to => "courses#edit_delivery_access", :as => :edit_delivery_access

  resources :deliveries do
    collection do
      post :assigment
     end
  end
  match "courses/:id/members", :to => "courses#members", :as => :course_members
  match "courses/:id/deliveries", :to => "deliveries#index", :as => :course_deliveries
  match "courses/:id/deliveries/new", :to => "deliveries#new", :as => :new_course_delivery
  match "courses/:id/dashboard_deliver", :to => "courses#dashboard_deliver"
  match "courses/:id/evaluation", :to => "courses#evaluation", :as => :course_evaluation
  match "courses/:id/send_mails", :to => "courses#send_mails", :as => :course_send_mails
  get    "deliveries/assigment", :to => "deliveries#assigment",:as => :assigment

  #resources :role_id_and_permission_ids

  #manejo de roles
  resources :roles

  resources :permissions


  #manejo de users

  devise_for :users  do
    match 'users/sign_out', :to => 'devise/sessions#destroy'
  end

   get  "/users/:personal_url", :to => "users#show",  :as =>  :show_user

   # import csv de usuarios
   get "users/" => "users#import", :as => :import_users
   post "users/upload_csv" => "users#upload_csv", :as => :upload_csv_users
   #match  "/users/", :to => "users#index",  :as =>  :users
   match  "/users/:personal_url/dashboard", :to => "users#dashboard", :as => :network_selector
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


  #manejo de usuarios en las networks
  resources :networks_users do
   collection do
    post :create_data
   end
  end

  # manejo de la landing page

  get "home/index"

  get "home/contact"

  get "home/terms"

  get "home/conditions"

  get "home/team"

  get "home/develop"

  get "home/blog"

  get "home/news"

  root :to => 'home#index'

  #comentarios
  match "/home/add_new_comment" => "home#add_new_comment", :as => "add_new_comment", :via => [:post]

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

   ####### rutas de estandarizacion de eventos

   match 'focus/:id', :to => 'events#show', :as => :eventuable

   ###### ruta para crear super admins

   match "canguro/admin/protocol/l4789471797l9392342lh3jijisfij3liii14adnainvftldlqnnifnai", :to => "superadmnin#create_super_admin", :as => :super_admin_create
   match "instructions_for_super_admin", :to => "superadmnin#instructions", :as => :super_admin_instructions

   # api para la mobile
   #this is for api for the mobile app
  namespace :api do
    resources :tokens,:only => [:create, :destroy]
  end
  match '/api/tokens/create', :to => 'api/tokens#create', :as => :login
  match '/api/api/publications', :to => 'api/api#publications', :as => :publicationsjson
  match '/api/api/comments', :to => 'api/api#comments', :as => :commentsjson
  match '/api/api/courses', :to => 'api/api#courses', :as => :coursesjson
  match '/api/api/notifications', :to => 'api/api#notifications', :as => :notificationsjson
  match '/api/api/create_comment', :to => 'api/api#create_comment', :as => :create_comment
  match '/api/api/create_delivery', :to => 'api/api#create_delivery', :as => :create_delivery
  match '/api/api/create_discussion', :to => 'api/api#create_discussion', :as => :create_discussion
end
