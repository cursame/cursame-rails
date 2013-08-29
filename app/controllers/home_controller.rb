class HomeController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :conditions, :blog, :help ]
  helper_method :get_commentable
 # layout 'landing', :only => [:index]

  def index
    if user_signed_in?
      #redirect_to "/users/#{current_user.personal_url}"
        redirect_to "/users/#{user_url}/dashboard"

    end
  end
  def conditions
  end
  
  def blog
  end
  
  ###### destroye sesiones caducadas
  def ending_session
      sign_out(current_user)
      
      redirect_to root_path
  end
  
  def help
  end
  def add_new_comment
    if user_signed_in?
      @from_enter_key = params[:from_enter_key] == 'true' ? true : false

      # esto es para clonar los comentarios de el grupo
      if params[:delivery] then
        params[:commentable_type] = 'Course'
        params[:delivery][:course_ids].each do |group_id|
          params[:commentable_id] = group_id
          save_comment
        end
        #esto es para comentarios que son publicos de la red
      elsif params[:is_user] then
        params[:commentable_type] = 'User'
        params[:commentable_id] = params[:is_user]
        save_comment
      else
        save_comment
      end

      if @comment.commentable_type == 'Network'   || (@comment.commentable_type == 'Course' && !@from_enter_key) || @comment.commentable_type == 'User'
        @publication = Wall.find_by_publication_type_and_publication_id("Comment",@comment.id)
      else
        #aqui obtenemos el tipo de publicación para poder agregarla via ajax
        @publication = Wall.find_by_publication_type_and_publication_id(@comment.commentable_type,@comment.commentable_id);
      end

      @editar = !params[:comment_id].blank?
    end
  end

  def finish_tour
    user = current_user
    last_info = user.tour_info
    pos = params[:data].to_i
    info = last_info[0...pos] + "1" + last_info[pos+1..last_info.length]
    user.tour_info = info
    user.save!
    respond_to do |format|
      format.js
      format.json
    end
  end

  def load_more_comments
    @publication = Wall.find(params[:id])
    @comments = @publication.publication.comments
    respond_to do |format|
          format.html
          format.js
    end
  end

  def upvote
      @publication = Wall.find(params[:id])
      @publication.publication.liked_by current_user
      respond_to do |format|
       #format.html
       format.js
     end
   end

   def downvote
     @publication = Wall.find(params[:id])
     @publication.publication.downvote_from current_user
     respond_to do |format|
       #format.html
       format.js
     end
   end

   def upvote_comment
        @publication = Comment.find(params[:id])
        @publication.liked_by current_user
        respond_to do |format|
         #format.html
         format.js
       end
     end

     def downvote_comment
       @publication = Comment.find(params[:id])
       @publication.downvote_from current_user
       respond_to do |format|
         #format.html
         format.js
       end
     end

     def destroy_wall
       publication = Wall.find(params[:id])
       if !publication.nil?
         publication.publication.destroy
          @id = publication.id
       end
       respond_to do |format|
         format.js
       end
     end

     def edit_wall
       @id = params[:id]
       @type = params[:type]
       puts '------------------------'
       puts @id 
       respond_to do |format|
         format.js
       end
     end

     def destroy_comment
       comment = Comment.find(params[:id])

       if !comment.nil?
         comment.destroy
         @id = comment.id
       end
       respond_to do |format|
         format.js
       end
     end

     def editing_n
       @notiv = current_user.notifications.where(:active => true)
       @notiv.each do |noti|
         noti.active = false
         noti.save
       end
       @user = current_user
         respond_to do |format|
            format.js
          end
     end
  # -----------------------------
  # Develop for parents
  # -----------------------------
=begin
  def my_son
     @id = params[:id]
     @user = User.find(@id)
     ##### comieza el acceso a surveys
     @acces_to_survey = @user.user_surveys
     ##### comienza el acceso a assignments
     @acces_to_assignment = @user.assignments

     ##### comienza el acceso a cursos
     @acces_to_courses = @user.courses.where(:active_status => true)

     #### promedio general
      @general_potential = 0
       @n = 0

       @acces_to_courses.each do |course|
            @member = course.members_in_courses.where(:user_id => @user.id)

            @member.each do |c|
                eval = c.evaluation
                 @n = @n + 1
                 @general_potential =  @general_potential+eval

           end
      end
       @general_potentia = @general_potential/ @n

  end

  def acces_on_course
    id_course = params[:course_id]
    id_user = params[:user_id]
    @course = Course.find(id_course)
    @user = User.find(id_user)

    ####### detectando si el usuario es miembro aprobado
    @member = MembersInCourse.find_by_user_id_and_course_id(id_user, id_course)

    if @member.accepted == true
       @mensaje = "su hijo es miembro del curso"
       ##### surveys actuales
         @survey_now = @course.surveys.where(:state => 'published')
        # puts @survey_now
       ##### surveys pasados
         @survey_old = @course.surveys.where(:state => 'unpublish')
        # puts @survey_old
       ##### deliveries actuales
         @delivery_now = @course.deliveries.where(:state => 'published')
        # puts @delivery_now
       #### deliveries pasadas
         @delivery_old = @course.deliveries.where(:state => 'unpublish')
        # puts  @delivery_old
    else
       @mensaje = "su hijo  no ha sido aceptado en el curso"
    end

  end
=end

  # chat behaviour of cursame
  # -----------------------------
  def closer_db
   
   
 #  if Rails.env == 'subtest'
   # @closer = ActiveRecord::Base.connection.close
    
    #@head_connections =  ActiveRecord::Base.clear_active_connections!
  
   
    
    
=begin
    @active = ActiveRecord::Base.verify_active_connections!
    @all = ActiveRecord::Base::Reapers
    alfredot_rifa_free_pro_forever
     puts  @active.count 
     puts "///////"
     puts @all.count
    @funct = ActiveRecord::Base.connection.disconnect!
    @status = ActiveRecord::Base.connected?
    ActiveRecord::Base.establish_connection(
        adapter: 'postgresql',
        host: 'ip-10-151-14-176.ec2.internal',
        database: 'cursalab',
        username: 'cursame',
        password: 'r8o54q58',
        encoding: 'unicode',
        timeout: 5000,
        pool: 5
    )
    @status_l = ActiveRecord::Base.connected?
=end
    #alfredot_rifa_free_pro_forever
    #puts "#{@status_l}"
    #puts " #{@status} "
   
 #  end
   
     respond_to do |format|
        format.js
      end
    
  end
 
  def render_notifications
    @notification = Notification.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  # -----------------------------
  # chat behaviour of cursame
  # -----------------------------

  def chat
      @channel = Channel.new
      @messages = @channel.mesages.paginate(:per_page => 10, :page => @page).order('created_at ASC')
      @show_chat_panel = false
      @page = 1
      respond_to do |format|
          format.html
      end
  end

    def open_channel
      if params[:course]
        @channel_name = "/messages/course_channel_"+ params[:id]
        users = Course.find(params[:id]).users
        
        ######## se agregan validadores de users para el exist #########
        
        users = users.keep_if{|x| x != nil}
        
        
      else
        ids = [current_user.id,params[:id].to_i]
        @channel_name = get_unique_channel_users(ids)
        users = User.find(ids)
        
      end
      @channel = find_or_insert_channel(@channel_name,users)
      @page = 1
      @messages = @channel.mesages.paginate(:per_page => 10, :page => @page).order('created_at DESC')
      respond_to do |format|
       format.js
      end
    end

    def add_new_mesage
      @message = Mesage.create!(:mesage => params[:mesage],:user_id =>current_user.id,:channel_id =>params[:channel_id])
      @channel_name = params[:channel_name]
      @channel_id = params[:channel_id]
      respond_to do |format|
       format.js
      end
    end

     def load_more_messages
        @channel = Channel.find(params[:id])
        @messages = @channel.mesages.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
        @page = params[:page].to_i
        respond_to do |format|
         format.js
        end
     end
     def load_more_notfications
        @notifications = current_user.notifications.paginate(:per_page => 10, :page => params[:page]).order("created_at DESC")
        @page = params[:page].to_i
        respond_to do |format|
         format.js
        end
     end

     def authentications_test
     end

  # manejo de paginas de error
  def not_found
    render :status => 404, :formats => [:html]
  end

  def server_error
    render :status => 500, :formats => [:html]
  end

  def parents
    @tutors = current_user.tutors
  end

  private

  def save_comment
    commentable = Comment.get_commentable(params[:commentable_id],params[:commentable_type])
    if params[:comment_id].blank? then
      @comment = commentable.comments.create!(:title=>'cursame',:comment => params[:comment],:user_id =>current_user.id,:network_id => current_network.id)
    else
      @comment = Comment.find(params[:comment_id])
      @comment.update_attributes(:comment => params[:comment])
    end
  end

  def get_unique_channel_users(ids)
    ids = ids.sort
    channel_name = "/messages/users_channel_"+ (ids * "_")
    return channel_name
  end

  def find_or_insert_channel(channel_name,users)
    channel = Channel.find_by_channel_name(channel_name)
    puts "---------------------"
    puts channel
    if !channel
      channel = Channel.create!(:channel_name=>channel_name,:channel_type => "")
      channel.users = users
      channel.save!
    end
    puts "----------el otro-----------"
    puts channel
    return channel
  end
  # The exception that resulted in this error action being called can be accessed from
  # the env. From there you can get a backtrace and/or message or whatever else is stored
  # in the exception object.
  def the_exception
    @e ||= env["action_dispatch.exception"]
  end
end
