class Api::Courses::CoursesController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def list
    courses = Course.paginate(per_page: 50, page: params[:page] || 1).where("courses.network_id = ?", params[:network_id])
    courses_json = courses.as_json(only: [ :id, :title, :created_at, :public_status ])
    render json: { pages: courses.total_pages, courses: courses_json }, status: 200
  end
end
