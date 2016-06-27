class Api::Courses::CoursesController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def list
    courses = Course.paginate(per_page: 50, page: params[:page] || 1).where("courses.network_id = ?", params[:network_id])
    courses_json = courses.as_json(
      include: {
        users: {
          only: [ :id, :first_name, :last_name, :email, :created_at, :sign_in_count, :last_sign_in_at ]
        }, deliveries: {
          only: [ :id, :title, :created_at ]
        }, surveys: {
          only: [ :id, :name, :created_at ]
        }, discussions: {
          only: [ :id, :title, :created_at, :evaluable ]
        }
      }, only: [ :id, :title, :created_at ]
    )
    render json: { pages: courses.total_pages, courses: courses_json }, status: 200
  end
end
