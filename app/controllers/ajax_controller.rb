class AjaxController < ApplicationController
  def update_user_profile_pic
    @user = User.find_by_id params[:user]
    @user.avatar = params[:file]

    if @user === current_user
      if @user.save
        response = { avatar: { profile: @user.avatar.profile.to_s, head: @user.avatar.head.to_s }, error: 0, message: "Success!!" }
      else
        response = { avatar: nil, error: 1, message: t('.ajax_controller.error1') }
      end
    else
      response = { avatar: nil, error: 1, message: t('.ajax_controller.error1') }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def update_user_cover_pic
    @user = User.find_by_id params[:user]
    @user.coverphoto = params[:file]

    if @user === current_user
      if @user.save
        response = { cover: @user.coverphoto.to_s, error: 0, message: "Success!!" }
      else
        response = { avatar: nil, error: 1, message: t('.ajax_controller.error1') }
      end
    else
      response = { avatar: nil, error: 1, message: t('.ajax_controller.error1') }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def update_course_cover_pic
    @course = Course.find_by_id params[:course]
    @course.coverphoto = params[:file]

    if @course.save
      response = { cover: @course.coverphoto.to_s, error: 0, message: "Success!!" }
    else
      response = { avatar: nil, error: 1, message: t('.ajax_controller.error1') }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def update_course_profile_pic
    @course = Course.find_by_id params[:course]
    @course.avatar = params[:file]

    if @course.save
      response = { avatar: { profile: @course.avatar.profile.to_s, head: @course.avatar.head.to_s }, course_id: @course.id, error: 0, message: "Success!!" }
    else
      response = { avatar: nil, course_id: @course.id, error: 1, message: t('.ajax_controller.error1') }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def network_students
     down = I18n.transliterate(params[:term].downcase.to_s)
     users =  User.includes(:permissionings).where("permissionings.role_id = 2 AND permissionings.network_id = ?", current_network.id).search(down)

    respond_to do |format|
      format.json { render json: users }
    end
  end

  def network_teachers
     down = I18n.transliterate(params[:term].downcase.to_s)
     users =  User.includes(:permissionings).where("permissionings.role_id = 3 AND permissionings.network_id = ?", current_network.id).search(down)

    respond_to do |format|
      format.json { render json: users }
    end
  end

  def network_users
    down = I18n.transliterate(params[:term].downcase.to_s)
    users =  current_network.users.search(down)

    respond_to do |format|
      format.json { render json: users }
    end
  end

end
