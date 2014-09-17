class Managers::BaseController < ApplicationController
  filter_access_to :all
  skip_before_filter :filter_access_filter, :only => :upload_users_a
  layout 'managers'
end