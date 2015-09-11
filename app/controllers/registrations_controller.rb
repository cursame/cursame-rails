class RegistrationsController < Devise::RegistrationsController

  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      #redirect_to show_user_path(current_user.personal_url)
    end
    if !params[:user][:user_id].blank?
      @user = User.find(params[:user][:user_id])
      user = User.find(current_user.id)
      params[:user].delete("user_id")



      if @user.update_attributes(params[:user])
        flash[:notice] = t('.registrations_controller.update')
        # Sign in the user bypassing validation in case his password changed
        if (user.id == @user.id)
          sign_in @user, :bypass => true
        end
      else
        flash[:notice] = t('.registrations_controller.error')
        render "edit"
      end

    else
      super
    end

  end

  def edit
    @user.build_user_language if @user.user_language.nil?
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    return "/awaiting_confirmation/#{resource.id}"
  end

  def after_update_path_for(resource)
      show_user_path(resource.personal_url)
  end

end
