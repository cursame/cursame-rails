class CommunityController < ApplicationController

  def users_by_role(role)
    requested_role = Role.find_by_title(role)
    permissionings = Permissioning.where(network_id: current_network.id, role_id: requested_role.id)
    users = permissionings.map do |permissioning|
      permissioning.user
    end
    users.keep_if do |user|
      user != current_user and not(user.nil?)
    end
  end

  def all_users_network
    users = current_network.users.compact
    users.keep_if do |user|
      user != current_user and not(user.nil?)
    end
  end

  def all
    @network_users = all_users_network
    @network_users_paginated = @network_users.paginate(:per_page => CARDS_PER_PAGE, :page => 1)
  end

  def students
    @students = users_by_role("student")
    @students_paginated = @students.paginate(:per_page => CARDS_PER_PAGE, :page => 1)
  end

  def teachers
    @teachers = users_by_role("teacher")
    @teachers_paginated = @teachers.paginate(:per_page => CARDS_PER_PAGE, :page => 1)
  end

  def paginate_ajax
    page = params[:page].to_i
    @role = params[:role]
    @next_page = page + 1

    case @role
      when 'all'
        @users = all_users_network
      when 'student'
        @users = users_by_role("student")
      when 'teacher'
        @users = users_by_role("teacher")
    end

    @users_paginated = @users.paginate(:per_page => CARDS_PER_PAGE, :page => page)
      
    respond_to do |format|
      format.js { render 'community/ajax/paginate_ajax' }
    end
  end

  def search
    @query = params[:query]
    @search_changes = params[:query].downcase
    docificate_search_changes = I18n.transliterate("#{@search_changes}")
    @users = current_network.users.search(docificate_search_changes).paginate(:per_page => 50, :page => params[:page]).order('users.first_name')
  end
end