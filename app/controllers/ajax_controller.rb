class AjaxController < ApplicationController
  def update_user_profile_pic
    @user = User.find_by_id params[:user]
    @user.avatar = params[:file]

    if @user === current_user
      if @user.save
        response = { avatar: { profile: @user.avatar.profile.to_s, head: @user.avatar.head.to_s }, error: 0, message: "Success!!" }
      else
        response = { avatar: nil, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
      end
    else
      response = { avatar: nil, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
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
        response = { avatar: nil, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
      end
    else
      response = { avatar: nil, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
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
      response = { avatar: nil, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
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
      response = { avatar: nil, course_id: @course.id, error: 1, message: "Ocurrio un error, porfavor intentalo de nuevo." }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def network_students
    respond_to do |format|
      format.json { render json: current_network.users.search(params[:term]) }
    end
  end

  def network_teachers
    respond_to do |format|
      format.json { render json: current_network.users.search(params[:term]) }
    end
  end
end