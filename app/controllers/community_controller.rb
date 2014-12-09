class CommunityController < ApplicationController

  def all
    @network_users = network_users
  end

  def students
    @students = network_students
  end

  def teachers
    @teachers = network_teachers
  end

  def paginate_ajax
    page  = params[:page].to_i
    @role = params[:role]
    @next_page = page + 1

    @community_users = case @role
      when 'all'
        network_users(page)
      when 'student'
        network_students(page)
      when 'teacher'
        network_teachers(page)
    end
      
    respond_to do |format|
      format.js { render 'community/ajax/paginate_ajax' }
    end
  end

  def search
    @query = params[:query]
    @search_changes = params[:query].downcase
    docificate_search_changes = I18n.transliterate("#{@search_changes}")
    @users = current_network.users.search(docificate_search_changes).paginate(per_page: 50, page: params[:page]).order('users.first_name')
  end

  private

  def network_users(page = 1)
    current_network.users.where('users.confirmed_at IS NOT NULL').paginate(per_page: CARDS_PER_PAGE, page: page)
  end

  def network_teachers(page = 1)
    current_network.users.joins(:permissionings)
      .where('permissionings.network_id = ? AND permissionings.role_id = 3 AND users.confirmed_at IS NOT NULL', current_network.id)
      .paginate(per_page: CARDS_PER_PAGE, page: page)
  end

  def network_students(page = 1)
    current_network.users.joins(:permissionings)
      .where('permissionings.network_id = ? AND permissionings.role_id = 2 AND users.confirmed_at IS NOT NULL', current_network.id)
      .paginate(per_page: CARDS_PER_PAGE, page: page)
  end

end