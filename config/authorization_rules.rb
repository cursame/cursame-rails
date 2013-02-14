authorization do
  role :admin do
    
    has_permission_on [:roles], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:courses], :to => [:users,:create,:destroy,:index,:show,:edit,:members]
    has_permission_on [:deliveries], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:comments], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:users], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:calendar], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:assets], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:discussions], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:surveys], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:events], :to => [:users,:create,:destroy,:index,:show,:edit]
    has_permission_on [:managers], :to => [:users,:create,:destroy,:index,:show,:edit, :wall,:members, :network_configuration]
    
    
  end
  
  role :student do
      has_permission_on [:roles], :to => [:users,:create,:destroy,:show,:edit]
      has_permission_on [:courses], :to => [:users,:index,:show]
      has_permission_on [:delivery], :to => [:show]
      has_permission_on [:comments], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:users], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:calendar], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:assets], :to => [:users,:create,:destroy,:index,:show,:edit] 
      has_permission_on [:assigments], :to => [:users,:create,:destroy,:index,:show,:edit]  
      has_permission_on [:events], :to => [:users,:create,:destroy,:index,:show,:edit]        
  end
  
  
  role :teacher do
      has_permission_on [:roles], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:courses], :to => [:users,:create,:destroy,:index,:show,:edit,:members]
      has_permission_on [:deliveries], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:comments], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:users], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:calendar], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:assets], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:discussions], :to => [:users,:create,:destroy,:index,:show,:edit]
      has_permission_on [:surveys], :to => [:users,:create,:destroy,:index,:show,:edit]
      
   end
  
  
  role :superadmin do
     has_permission_on :roles, :to => [:users,:create,:destroy,:index,:show,:edit ]
     
  end
  
end