class Api::ApiController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :authorize

  respond_to :json

  def publications
    case params[:type]
      when 'Course'
        @publications  = Course.find(params[:publicacionId]).walls.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
      else
        @publications = @network.walls.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    end
    render :json => {:publications => @publications.as_json(:include => [:publication,:user,:course,:network]), :count => @publications.count()}, :callback => params[:callback]
  end

  def comments
    @comments = Comment.where("commentable_type" => params[:commentable_type], "commentable_id" => params[:commentable_id]).paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:comments => @comments.as_json(:include => [:user]), :count => @comments.count()}, :callback => params[:callback]
  end

  def courses
    @courses = @network.courses.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:courses => @courses.as_json, :count => @courses.count()}, :callback => params[:callback]
  end

  def notifications
    notifications = @user.notifications
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
          :user => user
      }
      @user_notifications.push(notification)
    end
    #
    # @notifications = @user.notifications.includes(:notificator)

    render :json => {:notifications => @user_notifications.as_json, :count => @user_notifications .count()}, :callback => params[:callback]
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
    @network = @user.networks[0]
    if @user.nil?
      logger.info("Token not found.")
      render :status => 200, :json => {:message => "Invalid token", :success => false}
    end
  end
end