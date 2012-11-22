class UsersController < ApplicationController
  def show
    @user = User.find_by_personal_url(params[:personal_url])
  end

  
end
