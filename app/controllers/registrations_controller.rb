class RegistrationsController < Devise::RegistrationsController
  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    if !params[:user][:user_id].blank?
      @user = User.find(params[:user][:user_id])
      user = User.find(current_user.id)
      params[:user].delete("user_id")



      if @user.update_attributes(params[:user])
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        if (user.id == @user.id)
          sign_in @user, :bypass => true
        end
        redirect_to :back
      else
        render "edit"
      end
    else
      super
    end

  end

  protected

  def after_inactive_sign_up_path_for(resource)
    return "/awaiting_confirmation/#{resource.personal_url}"
  end
end
