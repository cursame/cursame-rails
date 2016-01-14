class OnboardingController < ApplicationController
  layout false

  def user_profile
    @user = User.find(current_user.id)
  end

  def update_user_profile
    @user =  User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bios,
                                 :twitter_link, :personal_url, :avatar, :coverphoto)
  end

end
