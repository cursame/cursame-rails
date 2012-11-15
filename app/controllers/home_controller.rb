class HomeController < ApplicationController
  def index
    commentable = current_user
    commentable.comments.create(:title => "First comment.", :comment => "This is the first comment.")

    @comments =  current_user.comments

    puts @comments
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
end
