class Api::ApiController < ApplicationController
	skip_before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
  before_filter :authorize  
  	
  respond_to :json
  
  def publications
    @publications = @network.walls.order('created_at DESC')   
    render :json => {:publications => @publications.as_json(:include => [:publication]), :count => @publications.count()}, :callback => params[:callback]      
  end

  def comments
    @comments = @network.comments.order('created_at DESC')   
    render :json => {:comments => @comments.as_json(:include => [:user]), :count => @comments.count()}, :callback => params[:callback]      
  end
  def courses
    @courses = @network.courses.order('created_at DESC')   
    render :json => {:courses => @courses.as_json, :count => @courses.count()}, :callback => params[:callback]      
	end

  def create_comment
    @comment = Comment.new
    @comment.commentable_type = params[:commentable_type]
    @comment.commentable_id = params[:commentable_id]
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