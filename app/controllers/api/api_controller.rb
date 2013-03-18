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

  private 
  def authorize
    @user=User.find_by_authentication_token(params[:auth_token])
    puts @user.to_yaml
    @network = @user.networks[0]
    puts @network
    if @user.nil?
       logger.info("Token not found.")
       render :status => 200, :json => {:message => "Invalid token", :success => false}        
    end
  end  
end