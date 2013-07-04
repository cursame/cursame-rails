class RegistrationsController < Devise::RegistrationsController

  def edit
    @user = User.find(params[:user_id])
    if @user.nil? then
    else
      render :edit
    end
  end

  def update_user
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(params[:user_id])

    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      #sign_in @user, :bypass => true
      render "/superadmnin/users"
    else
      render "/superadmnin/users"
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    return "/awaiting_confirmation/#{resource.personal_url}"
  end
end
