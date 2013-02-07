class HomeController < ApplicationController

  skip_before_filter :authenticate_user!
  helper_method :get_commentable
  

  def index
    if user_signed_in?
      #redirect_to "/users/#{current_user.personal_url}"
       redirect_to "/users/#{user_url}/dashboard" 
      
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
      # esto es para clonar los comentarios de el grupo
      if params[:delivery] 
        params[:commentable_type] = 'Course'
        params[:delivery][:course_ids].each do |group_id|
          params[:commentable_id] = group_id
          save_comment
        end
      #esto es para comentarios que son publicos de la red
      else
        save_comment
      end
      respond_to do |format|
        #format.html
        format.js
      end
    end     
  end

  protected
  def save_comment
    commentable = Comment.get_commentable(params[:commentable_id],params[:commentable_type])
    @comment = commentable.comments.create(:title=>'cursame',:comment => params[:comment],:user_id =>current_user.id)
  end
end
