class LoadLayoutController < ApplicationController
  def load_wall
  	respond_to do |format|
  		format.js
    end
  end

  def load_post_menu
    respond_to do |format|
      format.js
    end
  end

  def load_sidebar
  end

  def load_chat
  end
end
