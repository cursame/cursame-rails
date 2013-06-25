class RegistrationsController < Devise::RegistrationsController

  protected

  def after_inactive_sign_up_path_for(resource)
    return "/awaiting_confirmation/#{resource.personal_url}"
  end
end
