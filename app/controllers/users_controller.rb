# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  layout 'dashboardlayout', :only => [:dashboard]

  def show
    @user_l= User.find_by_personal_url(params[:personal_url])

    if @user_l.nil? then
      redirect_to :back
    end

    #@accesible_id = @user.id
    #helper methods in aplication controller
    pertenence!
    links
    @user_show = !(current_user.id == @user_l.id)
    #current_friend
    #validate_friend
    #current_user_friends
    #@friend = UserFriends.new
    @course = Course.new
    @delivery = Delivery.new
    @survey = Survey.new


   # @courses = Course.order(:by => :finish_date).limit(7).reverse

    @courses =  @user_l.members_in_courses.limit(7)
    @ccc =  @user_l.courses.where(:network_id => current_network.id)
    @count_course_iam_member =  MembersInCourse.where(:user_id => current_user.id, :accepted => true).count
    #@ccc.where(:active_status => true).count

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
      @search = params[:search]
      @page = params[:page].to_i
      @wall = @user_l.publications.search(@search,@id).paginate(:per_page => 10, :page => params[:page])
      # @wall = @user_l.walls.paginate(:per_page => 10, :page => params[:page])

      # @wall = @wall.reject{ |w| w.courses == true }
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
=begin
  def current_user_friends
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 2)
    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( @user.id, 2)
     if  @pending_relarionships_user_one != nil
        @relation_one = @pending_relarionships_user_one
        @user_one = User.find(@pending_relarionships_user_one.friend_one)
        @user_two = User.find(@pending_relarionships_user_one.friend_two)
      end
      if @pending_relarionships_user_two != nil
        @relation_two = @pending_relarionships_user_two
        @user_one_two = User.find(@pending_relarionships_user_two.friend_one)
        @user_two_two = User.find(@pending_relarionships_user_two.friend_two)
      end


  end

  def coverphoto
      @user = User.find_by_first_name(current_user.first_name)
  end


  def waiting_friends

    @user = current_user
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 1)
    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( @user.id, 1)

    if  @pending_relarionships_user_one != nil
      @relation_one = @pending_relarionships_user_one
      @user_one = User.find(@pending_relarionships_user_one.friend_one)
      @user_two = User.find(@pending_relarionships_user_one.friend_two)
    end
    if @pending_relarionships_user_two != nil
      @relation_two = @pending_relarionships_user_two
      @user_one_two = User.find(@pending_relarionships_user_two.friend_one)
      @user_two_two = User.find(@pending_relarionships_user_two.friend_two)
    end
  end
=end
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
=begin
   def friend
    @friend = UserFriends.new(params[:user_friend])
    @friend.friend_one = current_user.id
    @friend.friend_two = current_friend.id
    @friend.status_friendship = 1
    @friend.save!
   respond_to do |format|
    if @friend.save
        format.html{ redirect_to :back, :notice => "amigo agregado correctamente esperando que te acepte"}
        format.json { render json: @friend, status: :created, location: @friend }
        format.js
     else
        format.html{ redirect_to :back, :notice => "tu amigo no ha sido agregado"}
        format.json { render json: @friend.errors, status: :unprocessable_entity }
        format.js
    end
  end
 end

 def ufriend
   @friend  = UserFriends.find(params[:id])
   @friend.status_friendship = 2
   @friend.save
   respond_to do |format|
     if @friend.save
       format.html{ redirect_to :back, :notice => "amigo agregado correctamente esperando que te acepte"}
       format.json { render json: @friend, status: :created, location: @friend }
       format.js
      else
       format.html{ redirect_to :back, :notice => "tu amigo no ha sido agregado"}
       format.json { render json: @friend.errors, status: :unprocessable_entity }
       format.js
      end
    end
 end

 def sufriend
   @friend  = UserFriends.find(params[:id])
   @user = User.find(@friend.friend_one)
 end

 def validate_friend
   #cuando al usuario  le solicitaron ser amigos
   @second_friend_id = current_friend.id
   @friend_a = UserFriends.find_by_friend_two(@second_friend_id)
   #cuando el usuario solicita ser amigo de alguien
   @first_friend_if = current_user.id
   @friend_b = UserFriends.find_by_friend_one(@first_friend_if)
    #cuando el suaurio y el usuario ya solicito ser amigo
    @realtionship_users = UserFriends.find_by_friend_one_and_friend_two( @first_friend_if , @second_friend_id )

    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( current_user.id, 1)
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 1)

 end
=end
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
