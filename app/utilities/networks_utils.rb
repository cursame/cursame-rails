# coding: utf-8
module NetworksUtils

  def network_students(flag=false)
  	if flag
    	current_network.users.keep_if {|user| user.student?}
    else
    	current_network.users.keep_if {|user| user.student? and current_user != user}
    end
  end

  def network_teachers(flag=false)
  	if flag
  		current_network.users.keep_if {|user| user.teacher?}
  	else
  		current_network.users.keep_if {|user| user.teacher? and current_user != user}
  	end
  end

  def network_managers(flag=false)
  	if flag
    	current_network.users.keep_if {|user| user.admin?}
    else
    	current_network.users.keep_if {|user| user.admin? and current_user != user}
    end
  end
end