class SuperadmninController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create_super_admin, :instructions]
  
  def statistics
  end

  def networks
  end

  def users
  end

  def activities
    @activities = Activity.all
    @ac = @activities.count
  end

  def roles
  end

  def create_super_admin
  end

  def courses_sintetic_view_and_edit
  end

  def publicity_modul_controller
  end
  
  def instructions
  end
end
