class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  helper_method :get_commentable
  def index
    if user_signed_in?
      #redirect_to "/users/#{current_user.personal_url}"
      redirect_to show_user_path(user_url)
      
    end
  end

  def contact
  end

  def terms
  end

  def conditions
  end

  def team
  end

  def develop
  end

  def blog
  end

  def news
  end

  def add_new_comment
    if user_signed_in?
      commentable = get_commentable(params[:commentable_id],params[:commentable_type])
      @comment = commentable.comments.create(:title => current_user.email, :comment => params[:comment])
      respond_to do |format|
        format.js
      end
    end     
  end 

  def get_commentable(commentable_id,commentable_type)
    case commentable_type   
      when "User"        
      when "Comment"
       Comment.find(commentable_id)       
      when "Discussion"        
      when "Network"
        Network.find(commentable_id)
    end
  end

end
