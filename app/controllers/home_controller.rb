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
      commentable = Comment.get_commentable(params[:commentable_id],params[:commentable_type])
      @comment = commentable.comments.create(:title=>'mando',:comment => params[:comment],:user_id =>current_user.id)
      puts @comment.to_yaml
      respond_to do |format|
        format.js
      end
    end     
  end
end
