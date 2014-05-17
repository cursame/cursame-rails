# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :conditions, :blog, :help, :privacidad, :landing_page, :features, :press, :jobs, :contact, :apps, :request_demo, :success_stories, :send_contact_mail, :new_sesion_from_home, :teacher_day]
  helper_method :get_commentable
  prepend_before_filter :require_no_authentication, :only => [:action1, :action2]
  respond_to :html, :json, :js

  def index
    if user_signed_in?
      redirect_to "/users/#{user_url}/dashboard"
    elsif 
      redirect_to landing_page_path 
    end
  end

  def conditions
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def blog
    redirect_to "http://cursame.tumblr.com/"
  end

  ###### destroye sesiones caducadas
  def ending_session
    sign_out(current_user)
    redirect_to root_path
  end

  def help
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def landing_page
    resource = User.new()
    
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end
  
  def features
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def press
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def jobs
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def contact
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def apps
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def request_demo
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def teacher_day
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def send_contact_mail
    subject = params[:contact_type] == 'demo_request' ? 'Solictud de demo' : 'Contacto'  
    mail = Notifier.send_contact_mail(params, 'hola@cursa.me', subject, params[:contact_type] == 'demo_request')
    mail.deliver
    
    if params[:contact_type] == 'demo_request'
      mail = Notifier.send_contact_mail(params, 'gerardo@cursa.me', subject, true)
      mail.deliver
    end

    respond_to do |format|
      format.js
    end
  end

  def new_sesion_from_home
    @user = User.find_by_email(params[:email])

    if @user
      url =  "http://#{@user.subdomain}.#{links}"
    else
      url = "http://#{links}?error=mail"
    end 

    redirect_to url
  end

  def success_stories
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end

  def add_new_comment
    if user_signed_in?
      @from_enter_key = params[:from_enter_key] == 'true' ? true : false

      # esto es para clonar los comentarios de el grupo
      if params[:delivery] then
        params[:commentable_type] = 'Course'
        params[:delivery][:course_ids].each do |group_id|
          @course = Course.find_by_id(group_id)
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
        @publication = Wall.find_by_publication_type_and_publication_id("Comment", @comment.id)
      else
        #aqui obtenemos el tipo de publicación para poder agregarla via ajax
        @publication = Wall.find_by_publication_type_and_publication_id(@comment.commentable_type, @comment.commentable_id);
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

     def get_votes_of_publication
      @publication = Wall.find(params[:id])

      respond_to do |format|
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

      case @type
        when 'Delivery'
          @delivery = Delivery.find(@id)

        when 'Survey'
          @survey = Survey.find(@id)

        when 'Comment'
          @comment = Comment.find(@id)
          @commentable_id = @comment.commentable_id
          @commentable_type = @comment.commentable_type

        when 'Discussion'
          @discussion = Discussion.find(@id)
      end

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


  # chat behaviour of cursame
  # -----------------------------
  def closer_db
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
    @messages = [] # @channel.mesages.paginate(:per_page => 10, :page => @page).order('created_at ASC')
    @show_chat_panel = false
    @page = 1
    respond_to do |format|
        format.html
    end
  end

  def open_channel
    @receiver_user_id = params[:id].to_i

    if params[:course]
      @course_channel = true
      @channel_name = "/messages/course_channel_"+ @receiver_user_id.to_s

      users = Course.find(params[:id]).users
      ######## se agregan validadores de users para el exist #########
      users = users.keep_if{ |x| x != nil }

    else
      @course_channel = false
      ids = [current_user.id, @receiver_user_id]
      @channel_name = get_unique_channel_users(ids)
      users = User.find(ids)
    end
    
    @channel = find_or_insert_channel(@channel_name, users)
    @page = 1
    @messages = @channel.mesages.paginate(:per_page => 10, :page => @page).order('created_at DESC')
    respond_to do |format|
     format.js
    end
  end

    def add_new_mesage
      @message = Mesage.create!(:mesage => params[:mesage], :user_id =>current_user.id,:channel_id =>params[:channel_id])

      @az = @message
      @typed = @message.class.to_s
      activation_activity

      @channel_name = params[:channel_name]
      @channel_id = params[:channel_id]

      @emitter_user_id = current_user.id
      @receiver_user_id = params[:receiver_user_id]

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

  def logout_user
    PrivatePub.publish_to("/messages/chat_notifications",
                              userId: current_user.id,
                              online: false
                            )
    sign_out(current_user)
    respond_to do |format|
       format.js
    end
  end

  def update_wufoo_form
    wufoo = WuParty.new(ACCOUNT, API_KEY)
    wufoo_form = wufoo.form( params[:wufoo_form_id] )
    
    data = params.reject! do |k|
      k == 'utf8' || k == 'commit' || k == 'controller' || k == 'action' || k == 'wufoo_form_id'
    end

    puts data
    
    result = wufoo_form.submit(data)

    if result['Success'] == 0
      @error = result['ErrorText']
    else
      current_user.form_before_tour = true
      current_user.save
    end

    respond_to do |format|
      format.js
    end
  end
  
  def privacidad
    respond_to do |format|
      format.html {render :layout => 'static_pages'}
    end
  end  
  
  private

  def save_comment
    commentable = Comment.get_commentable(params[:commentable_id], params[:commentable_type])
    if params[:comment_id].blank? then
      @comment = commentable.comments.create!(:title=>'cursame', :comment => params[:comment], :user_id =>current_user.id, :network_id => current_network.id)

      # activity
      @az = @comment
      @typed = @comment.class.to_s
      activation_activity

      if (@comment.commentable_type == 'Course')
        # mailer = Notifier.send_comment_on_course(@comment)
        # mailer.deliver
      end

      if (@comment.commentable_type == 'Comment')
        if (@comment.commentable.commentable_type == 'Course')
          # mailer = Notifier.send_comment_on_course(@comment)
          # mailer.deliver
        end
      end
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

    if !channel #canal nuevo
      channel = Channel.create!(:channel_name=>channel_name,:channel_type => "")
      channel.users = users
      channel.save!
    end # el canal ya existe
    return channel
  end
  
  # The exception that resulted in this error action being called can be accessed from
  # the env. From there you can get a backtrace and/or message or whatever else is stored
  # in the exception object.
  def the_exception
    @e ||= env["action_dispatch.exception"]
  end
end
