Cursame30Lb::Application.routes.draw do
  
  

    

  resources :compart_assets

  resources :assets

  resources :areas_of_evaluations

  resources :assignments

  resources :surveys

  # colocando miembros en cursos
  resources :members_in_courses

  resources :courses
  
  resources :deliveries
  match "courses/:id/members", :to => "courses#members", :as => :course_members
  match "courses/:id/deliveries", :to => "deliveries#index", :as => :course_deliveries
  match "courses/:id/deliveries/new", :to => "deliveries#new", :as => :new_course_delivery
  
  #resources :role_id_and_permission_ids

  #manejo de roles
  resources :roles 
  
  resources :permissions
  

  #manejo de users
  
  devise_for :users  do
    match 'users/sign_out', :to => 'devise/sessions#destroy'
  end
  
   match  "/users/:personal_url", :to => "users#show",  :as =>  :show_user
   match  "/users/", :to => "users#index",  :as =>  :users_path
      #friends
  resources :user_friends
  match  "users/:personal_url/friends", :to => "users#friend", :as => :create_user_friends
  match  "users/:personal_url/waiting_friends/:id/update", :to => "users#ufriend", :as => :update_user_friends
  match  "users/:personal_url/waiting_friends/:id", :to => "users#sufriend", :as => :show_user_friends
  match  "users/:personal_url/waiting_friends", :to => "users#waiting_friends", :as => :user_waiting_friends
  get "users/:personal_url/coverphoto", :to => "users#coverphoto", :as => "cover_photo"

  
  #manejo de networks
  
  get "networks_users/create"

  get "networks_users/new"
  
  match "networks_users/index", :to => "networks#register", :at => :networks_user

  resources :network_templates

  resources :networks
  match '/' => 'networks#show', :constraints => { :subdomain => /.+/ }
  
  
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

  #surveys
  match "/surveys/survey_reply" => "surveys#survey_reply", :as => "add_survey_reply", :via => [:post]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
