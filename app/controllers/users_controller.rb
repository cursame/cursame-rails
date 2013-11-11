# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  layout 'dashboardlayout', :only => [:dashboard]

  def show
    @user_l= User.find_by_personal_url(params[:personal_url])
    
    if @user_l.nil? then
      redirect_to not_found_path
      return
    end

    #helper methods in aplication controller
    pertenence!
    links
    #@user_show = !(current_user.id == @user_l.id)
    @user_show = true
    @course = Course.new
    @delivery = Delivery.new
    @survey = Survey.new

    @courses =  @user_l.members_in_courses.limit(7)
    @ccc =  @user_l.courses.where(:network_id => current_network.id)
    @count_course_iam_member =  MembersInCourse.where(:user_id => current_user.id, :accepted => true).count

    @count_course_iam_member_and_owner =  @user_l.members_in_courses.where(:owner => true, :network_id => current_network.id, :active_status => true).count

    @course_count = Course.count
    @member =   @user_l.members_in_courses.where(:owner => true)

    #==== Areas de evaluación ====
    @areas_of_evaluation = AreasOfEvaluation.new
    areas_of_evaluations = @delivery.areas_of_evaluations.build

   ### publicando comentarios en el show de users
     @network_comments = current_network.comments
     @comments = @network_comments.where(:user_id => @accesible_id)

   ### wall
      @id = params[:id]
      id_search = params[:id_search]
      @search = params[:search]
      @page = params[:page].to_i
      if id_search.nil?
        @wall = @user_l.publications.search(@search, @id).paginate(:per_page => 10, :page => params[:page])
      else
        @wall = @user_l.publications.search(@search, id_search).paginate(:per_page => 10, :page => params[:page])
      end

     ##### print assets
     @asset = Asset.new
     assets = @delivery.assets.build

   #### manager courses
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user_l }
      end
    end
  end
  
 def pertenence!
   if current_network && @user = User.find_by_personal_url(params[:personal_url])
     @user_pertenence = NetworksUser.find_by_user_id(@user.id)
     if @user_pertenence != nil
       @networks_petenence_user = @user_pertenence.network_id
       @network = Network.find_by_id(@networks_petenence_user)
       @n = @network
     else
       @notice = "no estas inscrito en ninguna red"
     end
   end
 end
 def index
   @user = User.all
   redirect_to network_comunity_path
 end

 def dashboard
 end

 def old_courses
   @old_course_for_user = current_user.courses.where(:active_status => false)
   respond_to do |format|
     #format.html
     format.json
     format.js
   end
 end

 def acces_courses
   @course_for_user = current_user.courses.where(:active_status => true)
   respond_to do |format|
     #format.html
     format.json
     format.js
   end
 end

 def confirm
   user = User.find_by_id(params[:user_id])
   user.confirm!
   user.save!
   respond_to do |format|
     format.json
     format.js
   end
 end

  def set_password
    user = User.find_by_id(params[:user_id])
    user.password = params[:password]
    if user.save!
      last_info = user.tour_info
      pos = 3
      if last_info.length < 4
        info = last_info + '1'
      else
        info = last_info[0...pos] + "1" + last_info[pos+1..last_info.length]
      end

      user.tour_info = info
      # user.save!
      user.update_attributes(:tour_info => info)
      sign_in user, :bypass => true

    end
    respond_to do |format|
       format.json
       format.js
    end
  end

  def corroborate_url
    @user = User.find_by_personal_url(params[:personal_url])
    puts '####################'
    puts @user
    puts '####################'

     if @user == nil
        @url = true
     else
        @url = false
     end

    end

end
