class SuperadminPanel::BaseController < ApplicationController

  before_filter :authorize_access

  layout 'superadmin_panel'

  protected

  def authorize_access
    unless current_user && current_user.superadmin?
      flash[:error] =  I18n.t("errors.messages.access_denied")
      redirect_to root_path
    end
  end
end
