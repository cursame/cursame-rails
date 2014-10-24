class Api::User::UsersController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def teachers
    teachers = User.includes(:permissionings).where('permissionings.role_id = 3').paginate(per_page: 50, page: params[:page] || 1)
    teachers_array = teachers.as_json(
      include: { 
        courses: { 
          only: [ :id, :title, :created_at ] 
        }
      }, only:  [ :id, :first_name, :last_name, :email, :created_at ]
    )
    render json: { pages: teachers.total_pages, teachers: teachers_array }, status: 200
  end

end
