authorization do
  role :admin do
    has_permission_on [:roles], :to => [:users,:create,:destroy,:index,:show,:edit]
  end
  
  role :alumno do
    # has_permission_on :roles, :to => []
  end
  
end