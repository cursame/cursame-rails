class HomeController < ApplicationController
  def index
    if user_signed_in?
      @comments =  current_user.comments
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
      commentable = current_user
      @comment = commentable.comments.create(:title => current_user.email, :comment => params[:comment])
      respond_to do |format|
        format.js
      end
    end     
  end
end
