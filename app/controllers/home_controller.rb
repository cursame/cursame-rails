# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :conditions, :blog, :help, :privacidad, :landing_page, :features, :press, :jobs, :contact, :apps, :request_demo, :success_stories, :send_contact_mail, :new_sesion_from_home, :teacher_day, :mkt, :about_us, :mkt_thanks]
  helper_method :get_commentable
  prepend_before_filter :require_no_authentication, only: [:action1, :action2]
  respond_to :html, :json, :js
  layout 'errors', only: [:not_found, :server_error]

  def index
    if user_signed_in?
      redirect_to "/users/#{user_url}/dashboard"
    elsif
      redirect_to landing_page_path
    end
  end

  def conditions
    respond_to do |format|
      format.html {render layout: 'static_pages'}
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
      format.html {render layout: 'static_pages'}
    end
  end

  def landing_page
    resource = User.new()

    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def features
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def press
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def jobs
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def contact
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def apps
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def request_demo
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def teacher_day
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def about_us
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  def mkt
    pages = ["ad01"]

    if pages.include? params[:name]
      render "/home/mkt_pages/#{params[:name]}", layout: 'mkt_langing_page'
    else
      redirect_to root_path
    end
  end

  def mkt_thanks
    if params[:success].present? && params[:success] == "1"
      render "/home/mkt_pages/mkt_thanks", layout: 'mkt_langing_page'
    else
      redirect_to root_url
    end
  end

  def send_contact_mail

    mails = ['fernanda@cursa.me', 'hola@cursa.me']

    mails.each do |mail|
      subject = params[:contact_type] == 'demo_request' ? t('.home.demo') : t('.home.contact')
      mail = Notifier.send_contact_mail(params, mail, subject, params[:contact_type] == 'demo_request')
      mail.deliver
    end

    @mkt = params[:mkt_langin_id]

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
      format.html {render layout: 'static_pages'}
    end
  end

  def add_new_comment
    if user_signed_in?

      if params[:asset]
        asset = Asset.new(params[:asset])
        asset.user_id = params[:user_id]
        asset.save!
        params[:comment] = asset.filename.to_s
      end

      if params[:commentable_type] == "Discussion" && current_user.student? && DiscussionResponse.find_by_discussion_id_and_user_id(params[:commentable_id], current_user.id).nil?
        DiscussionResponse.create discussion_id: params[:commentable_id], user_id: current_user.id
      end

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

      if @failure
        return
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
    @id = params[:id]
    @type_context = params[:type].downcase

    case @type_context
    when 'discussion'
      context = Discussion.find_by_id(@id)
    when 'comment'
      context = Comment.find_by_id(@id)
    when 'survey'
      context = Survey.find_by_id(@id)
    when 'delivery'
      context = Delivery.find_by_id(@id)
    when 'course'
      context = Course.find_by_id(@id)
    end
    @comments = context.comments

    respond_to do |format|
      format.js { render 'comments/ajax/load_more_comments' }
    end
  end

  def upvote
    @publication = Wall.find_by_id(params[:id])
    @publication.publication.liked_by(current_user)
    respond_to do |format|
      format.js
    end
  end

  def downvote
    @publication = Wall.find_by_id(params[:id])
    @publication.publication.downvote_from current_user

    respond_to do |format|
      format.js
    end
  end

  def upvote_comment
    @publication = Comment.find_by_id(params[:id])
    @publication.liked_by current_user

    respond_to do |format|
      format.js
    end

  end

  def downvote_comment
    @publication = Comment.find(params[:id])
    @publication.downvote_from current_user

    respond_to do |format|
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
    publication = Wall.find_by_id(params[:id])
    @deleted_from = params[:deleted_from]

    if !publication.nil?
      publication.publication.destroy
      @id = publication.id
    end

    flash.now[:success] = t('.home.delete_publication')

    respond_to do |format|
      format.js
    end
  end

  def edit_wall
    @id = params[:id]
    @type = params[:type]
    @wall_publication = Wall.find_by_publication_type_and_publication_id(@type, @id)

    case @type
    when 'Delivery'
      @delivery = Delivery.find_by_id(@id)
    when 'Survey'
      @survey = Survey.find_by_id(@id)
    when 'Comment'
      @comment = Comment.find_by_id(@id)
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
    @notiv = current_user.notifications.where(active: true)
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
    @messages = [] # @channel.mesages.paginate(per_page: 10, page: @page).order('created_at ASC')
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

      users = Course.find_by_id(params[:id]).users
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
    @messages = @channel.mesages.paginate(per_page: 10, page: @page).order('created_at DESC')
    respond_to do |format|
      format.js
    end
  end

  def add_new_mesage
    @message = Mesage.create!(mesage: params[:mesage], user_id: current_user.id,channel_id: params[:channel_id])

    @user_channel = if (@message.user == current_user && not(@message.channel.nil?) && not(@message.channel.users.index{|x| x.id != current_user.id}.nil?))
      @message.channel.users[@message.channel.users.index{|x| x.id != current_user.id}]
    else
      @message.user
    end


    @az = @message
    @typed = @message.class.to_s
    activation_activity

    @channel = Channel.find_by_id(params[:channel_id])
    @channel_name = params[:channel_name]
    @channel_id = params[:channel_id]

    @type = @channel_name.split("/").last["course"].nil? ? "User" : "Course"

    if (@type == "Course")
      @course = Course.find_by_id(@channel_name.split("/").last.split("_").last)
    end

    @emitter_user_id = current_user.id
    @receiver_user_id = params[:receiver_user_id]

    respond_to do |format|
      format.js
    end
  end

  def load_more_messages
    @channel = Channel.find(params[:id])
    @messages = @channel.mesages.paginate(per_page: 10, page: params[:page]).order('created_at DESC')
    @page = params[:page].to_i
    respond_to do |format|
      format.js
    end
  end

  def load_more_notfications
    @notifications = current_user.notifications.paginate(per_page: 10, page: params[:page]).order("created_at DESC")
    @page = params[:page].to_i
    respond_to do |format|
      format.js
    end
  end

  def authentications_test
  end

  # manejo de paginas de error
  def not_found
    render status: 404, formats: [:html]
  end

  def server_error
    render status: 500, formats: [:html]
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

  def privacidad
    respond_to do |format|
      format.html {render layout: 'static_pages'}
    end
  end

  private

  def save_comment
    commentable = Comment.get_commentable(params[:commentable_id], params[:commentable_type])
    if params[:phase]
      phase_id = params[:phase].first
    end
    if params[:comment_id].blank? then
      begin
        @comment = commentable.comments.create!(title: 'cursame',
                                                comment: params[:comment],
                                                user_id: current_user.id,
                                                network_id: current_network.id,
                                                phase_id: phase_id)
      rescue
        @failure = true
        return
      end
      # activity
      @az = @comment
      @typed = @comment.class.to_s
      activation_activity
    else
      @comment = Comment.find(params[:comment_id])
      @comment.update_attributes(comment: params[:comment])
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
      channel = Channel.create!(channel_name: channel_name, channel_type: "#{channel_name["course"] ? "Course" : "User"}")
      channel.users = users
      p channel.users.map{|x| x.id}
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
