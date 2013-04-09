class Api::ApiController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :authorize

  respond_to :json

  def publications
    case params[:type]
      when 'Course'
        @publications = Course.find(params[:publicacionId]).walls.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
      else
        @publications = @user.walls.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    end

    @publications.each do |publication|
      publication.likes = publication.likes.size
    end
    render :json => {:publications => @publications.as_json(:include => [{:publication => {:include => [:comments]}}, :user, :course, :network]), :count => @publications.count()}, :callback => params[:callback]
  end

  def comments
    @comments = Comment.where("commentable_type" => params[:commentable_type], "commentable_id" => params[:commentable_id]).order('created_at ASC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)

    @comments.each do |comment|
      comment.likes = comment.likes.size
    end
    render :json => {:comments => @comments.as_json(:include => [:user, :comments]) , :count => @comments.count()}, :callback => params[:callback]
  end

  def courses
    @courses = @network.courses.order('created_at ASC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:courses => @courses.as_json, :count => @courses.count()}, :callback => params[:callback]
  end

  def users
    @users = @network.users.paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:users => @users.as_json, :count => @users.count()}, :callback => params[:callback]
  end

  def notifications
    notifications = @user.notifications.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    @num_notifications = notifications.count()

    @user_notifications = Array.new
    notifications.each do |notification|
      user = notification.user
      notificator = notification.notificator
      case notification.kind
        when 'user_comment_on_network'
          cretator = notification.notificator.user
        when 'user_comment_on_course'
          cretator = notification.notificator.user
        when 'new_delivery_on_course'
          cretator = notification.notificator.user
          course = Course.last #Assignment.find_by_delivery_id_and_course_id(notification.notificator.id,@user.id).course
        when 'new_public_course_on_network'
          cretator = notification.notificator.user
        when 'new_survey_on_course'
      end
      notification.notificator_type = {
          :creator => cretator,
          :course => course,
          :notificator => notificator,
          :user => user,
      }
      @user_notifications.push(notification)
    end
    #
    # @notifications = @user.notifications.includes(:notificator)
    render :json => {:notifications => @user_notifications.as_json, :num_notifications => @num_notifications}, :callback => params[:callback]
  end

  def create_comment
    @comment = Comment.new
    @comment.commentable_type = params[:commentable_type]
    @comment.commentable_id = params[:commentable_id] || @user.id
    @comment.comment = params[:comment]
    @comment.user = @user
    @comment.network = @network
    @comment.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_like
    case params[:type]
      when 'Course'
        @object = Course.find(params[:id])
      when 'Comment'
        @object = Comment.find(params[:id])
      when 'Delivery'
        @object = Delivery.find(params[:id])
      when 'User'
        @object = User.find(params[:id])
      when 'Discussion'
        @object = Discussion.find(params[:id])
      when 'Survey'
        @object = Survey.find(params[:id])
    end

    if is_liked_by_current_user(@object)
      puts 'existe'
      @object.disliked_by @user
    else
      puts 'no existe'
      @object.liked_by @user
    end
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_delivery
    @delivery = Delivery.new
    @delivery.title = params[:title]
    @delivery.description = params[:description]
    @delivery.publish_date = params[:publication]
    @delivery.end_date = params[:deliver]
    @delivery.porcent_of_evaluation = params[:value]
    @delivery.user = @user
    @delivery.network = @network
    @delivery.courses.push(Course.find(params[:courseId]))

    @delivery.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_discussion
    @discussion = Discussion.new
    @discussion.title = params[:title]
    @discussion.description = params[:discussion]
    @discussion.user = @user
    @discussion.network = @network
    @discussion.courses.push(Course.find(params[:courseId]))

    @discussion.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  private
  def authorize
    @user=User.find_by_authentication_token(params[:auth_token])
    # @notifications_chanel = nil
    # if PrivatePub.signature_expired?
      @notifications_chanel =  PrivatePub.subscription(:channel => "/notifications/"+@user.id.to_s)
    # end

    @network = @user.networks[0]
    if @user.nil?
      logger.info("Token not found.")
      render :status => 200, :json => {:message => "Invalid token", :success => false}
    end
  end

  def is_liked_by_current_user(object)
    @bandera = false
    object.likes.each do |like|
      if like.voter_id == @user.id
        @bandera = true
      end
    end
    return @bandera
  end
end