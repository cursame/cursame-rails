authorization do
  role :admin do
    has_permission_on [:roles], :to => [:users,:create,:destroy,:index,:show,:edit]
  end
  
  role :alumno do
     has_permission_on :roles, :to => [:users, :create, :edit, :destroy ]
  end
  
  
  role :profesor do
     has_permission_on :roles, :to => [:users, :create, :edit, :destroy, :show ]
  end
  
  
  role :superadmin do
     has_permission_on :roles, :to => [:users,:create,:destroy,:index,:show,:edit ]
  end
  
end