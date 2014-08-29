class RobotsController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :txt
  def robots
  end
end
