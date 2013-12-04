ActiveAdmin.register Permissioning do
  index do
      column :role
      column :user_id do |permissioning|
          link_to truncate("#{permissioning.user}", :omission => "...", :length => 30), admin_user_path("#{permissioning.user_id}")
      end
      column :network
      column :created_at
      default_actions
      
      
  end
  
   filter :role
   filter :user
   filter :network
           
end
