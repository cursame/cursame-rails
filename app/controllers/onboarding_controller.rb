class OnboardingController < ApplicationController
  filter_access_to :all

  def user_profile
    @user = User.find(current_user.id)
  end

  def update_user_profile
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to (current_user.teacher? ? onboarding_tour_video_path : onboarding_friendship_path)
    else
      flash[:alert] = t('.onboarding.user_profile.cannot_update_profile')
      render :user_profile
    end
  end

  def show_tour_video
    complete_onboarding
  end

  def show_network_users
    @network_users = network_users
  end

  private

  def network_users(page = 1)
    current_network.users.where('users.confirmed_at IS NOT NULL').paginate(per_page: CARDS_PER_PAGE, page: page)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bios,
                                 :twitter_link, :personal_url, :avatar, :coverphoto)
  end

  def complete_onboarding
    user = User.find(current_user.id)
    user.onboarding = true
    user.save
  end
end
