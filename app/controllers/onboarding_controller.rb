class OnboardingController < ApplicationController
  layout false

  def user_profile
    @user = User.find(current_user.id)
  end

  def update_user_profile
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to (current_user.teacher? ? onboarding_new_course_path : onboarding_select_courses_path)
    else
      flash[:alert] = t('.onboarding.user_profile.cannot_update_profile')
      render :user_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bios,
                                 :twitter_link, :personal_url, :avatar, :coverphoto)
  end

end
