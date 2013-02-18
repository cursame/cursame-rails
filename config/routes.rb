Cursame30Lb::Application.routes.draw do
   
###### configuración de managers de la red

  get "managers/wall"

  get "managers/members"

  get "managers/network_configuration"

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

  resources :assignments

  resources :surveys

  # colocando miembros en cursos
  resources :members_in_courses

  resources :courses do
     resources :assignments
     
    collection do
      post :assigment
     end
  end
  
  resources :deliveries do
    collection do
      post :assigment
     end
  end
  match "courses/:id/members", :to => "courses#members", :as => :course_members
  match "courses/:id/deliveries", :to => "deliveries#index", :as => :course_deliveries
  match "courses/:id/deliveries/new", :to => "deliveries#new", :as => :new_course_delivery
  get    "deliveries/assigment", :to => "deliveries#assigment",:as => :assigment
  
  #resources :role_id_and_permission_ids

  #manejo de roles
  resources :roles 
  
  resources :permissions
  

  #manejo de users
  
  devise_for :users  do
    match 'users/sign_out', :to => 'devise/sessions#destroy'
  end
  
   match  "/users/:personal_url", :to => "users#show",  :as =>  :show_user
   
   match  "/users/", :to => "users#index",  :as =>  :users
   match  "/users/:personal_url/dashboard", :to => "users#dashboard", :as => :network_selector
      #friends
  resources :user_friends
  match  "users/:personal_url/friends", :to => "users#friend", :as => :create_user_friends
  match  "users/:personal_url/waiting_friends/:id/update", :to => "users#ufriend", :as => :update_user_friends
  match  "users/:personal_url/waiting_friends/:id", :to => "users#sufriend", :as => :show_user_friends
  match  "users/:personal_url/waiting_friends", :to => "users#waiting_friends", :as => :user_waiting_friends
  get "users/:personal_url/coverphoto", :to => "users#coverphoto", :as => "cover_photo"

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
  
end
