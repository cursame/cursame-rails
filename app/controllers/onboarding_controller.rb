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

  def new_course
    @course = Course.new
  end

  def create_course
    @course = Course.new(params[:course])
    @course.network = current_network
    if @course.save
      add_teacher(@course.id)
      add_cursame_evaluation(@course)
      redirect_to onboarding_select_users_path(@course.id)
    else
      flash[:alert] = t('.onboarding.create_course.cannot_create_course')
      render :new_course
    end
  end

  def select_users
    @course = Course.find params[:id]
  end

  def add_users
    @course = Course.find params[:id]
    students = params[:students] || {}
    user_ids = students.map{|key, value| key}
    users = []

    user_ids.each do |user_id|
      users.push User.find_by_id user_id
    end

    @course.update_members(users, current_user)
    redirect_to onboarding_evaluation_schema_path(@course.id)
  end

  def evaluation_schema
    @course = Course.find params[:id]
  end

  def add_evaluation_schema
    @course = Course.find params[:id]
    if @course.update_attributes(params[:course]) and valid_evaluation
      redirect_to root_path
    else
      redirect_to onboarding_evaluation_schema_path(@course.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bios,
                                 :twitter_link, :personal_url, :avatar, :coverphoto)
  end

  def add_teacher id
    MembersInCourse.create(
      user_id: current_user.id,
      course_id: id,
      accepted: true,
      owner: true,
      network_id: current_network.id
    )
  end

  def add_cursame_evaluation course
    EvaluationCriterium.create(name: 'cursame_deliveries', evaluable: course)
    EvaluationCriterium.create(name: 'cursame_surveys', evaluable: course)
    EvaluationCriterium.create(name: 'cursame_discussions', evaluable: course)
  end

  def valid_evaluation
    total = 0
    params[:course][:evaluation_criteria_attributes].each do |criterion|
      total += criterion[1][:evaluation_percentage].to_i if criterion[1][:_destroy] == 'false'
    end
    total == 100
  end
end
