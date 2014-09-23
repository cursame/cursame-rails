# coding: utf-8
module NetworksUtils

  def network_students
    current_network.users.keep_if {|user| user.student?}
  end

  def network_teachers
  	current_network.users.keep_if {|user| user.teacher?}
  end

  def network_managers
    current_network.users.keep_if {|user| user.admin?}
  end

end