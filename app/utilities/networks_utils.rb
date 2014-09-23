# coding: utf-8

module NetworksUtils
  
  def network_students
  	return network_students = current_network.users.keep_if {|user| user.student?}
    #return "Network Students"
  end

  def network_teachers
  	return network_students = current_network.users.keep_if {|user| user.teacher?}
  end

  def network_managers
    return network_students = current_network.users.keep_if {|user| user.admin?}
  end
end