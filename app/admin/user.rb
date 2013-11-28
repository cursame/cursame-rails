ActiveAdmin.register User do

 index do
    column :email
    column :first_name
    column :last_name
    column :domain
    column :subdomain
    column :confirmed_at
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
            f.has_many :permissionings, :allow_destroy =>true, :new_record => false do |pn|                
               pn.inputs  "Permissioning" do
               pn.input :role_id, :as => :select,      :collection => Hash[Role.all.map{|b| [b.title,b.id]}]
          	   pn.input :network_id, :as => :select, :collection => Hash[Network.all.map{|b| [b.name,b.id]}]
               end
            end
          
          
        #f.has_many :permissionings, :allow_destroy => true, :heading => 'permissioning', :new_record => true do |p|
        #
      	#        p.input :role_id, :as => :select,      :collection => Hash[Role.all.map{|b| [b.title,b.id]}]
        # end
     
      
      f.input :accepted_terms
          
    end
    f.actions
  end
end
