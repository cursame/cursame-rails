ActiveAdmin.register User do



 index do
    panel "Importar usuarios" do
     render partial: '/admin/form_for_import_users_to_network'
    end
    column :email do |user|
      link_to truncate("#{user.email}", :omission => "...", :length => 27), admin_user_path(user)
    end
    column :first_name do |user|
      link_to truncate("#{user.first_name}", :omission => "...", :length => 35), admin_user_path(user)
    end
    column :last_name do |user|
      link_to truncate("#{user.last_name}", :omission => "...", :length => 35), admin_user_path(user)
      
    end
    column :subdomain do |user|
      link_to truncate("#{ user.permissionings[0].network.name}", :omission => "...", :length => 35), admin_network_path("#{user.permissionings[0].network.id}")
    end
    column :permissionings do |user|
      link_to  "#{user.permissionings[0].role.title}", admin_permissioning_path("#{user.permissionings[0].id}")
    end
    column :accepted_terms
    column :online
    default_actions
  end




  
 
  filter :email
  filter :first_name
  filter :last_name

 

  form do |f|
    f.inputs "Course Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :personal_url
      f.input :domain
      f.input :subdomain
      f.input :accepted_terms
      f.input :confirmed_at, :as => :date_select, :label => "Confirmado", :required => false
      
       if f.object.new_record? == true
       f.object.permissionings.build
     
       f.inputs "Agregar primer permiso" do 
       f.semantic_fields_for :permissionings do |p|
            p.inputs do
              p.input :role_id, :as => :select, :collection => Hash[Role.all.map{|b| [b.title,b.id]}]
            end
            
            p.inputs  do
           	  p.input :network_id, :as => :select, :collection => Hash[Network.all.map{|b| [b.name,b.id]}]
          	end
       end
       end
       
        else
          
       #f.inputs "Permisos actuales" do 
       
       #f.has_many :permissionings do  |fp| 
        #  fp.inputs do          
         #   fp.input :role_id, :as => :select, :collection => Hash[Role.all.map{|b| [b.title,b.id]}]
        #  end
        #  fp.inputs do          
         #   fp.input :network_id, :as => :select, :collection => Hash[Network.all.map{|b| [b.name,b.id]}]
        #  end
            #fp.input :user_id, :value => User
         #   fp.actions do
          #  fp.action :submit
           # end
       #end 
       #end   
       end        
    end
    f.actions
  end

end
