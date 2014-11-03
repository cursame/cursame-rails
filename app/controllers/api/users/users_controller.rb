class Api::Users::UsersController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def teachers
    if !params[:network_id].nil?
      teachers = User.includes(:permissionings).where('permissionings.role_id = 3 AND permissionings.network_id = ?', params[:network_id]).paginate(per_page: 50, page: params[:page] || 1)
    else
      teachers = User.includes(:permissionings).where('permissionings.role_id = 3').paginate(per_page: 50, page: params[:page] || 1)
    end
    teachers_array = teachers.as_json(
      include: { 
        courses: { 
          only: [ :id, :title, :created_at ] 
        },
        networks: {
          only: [ :id, :subdomain, :name, :created_at ]
        }
      }, only:  [ :id, :first_name, :last_name, :email, :created_at, :sign_in_count ]
    )
    render json: { pages: teachers.total_pages, teachers: teachers_array }, status: 200
  end

  def total
    total  = []
    1.month.ago.to_date.upto(Date.today) do |date|
      total << {
        date: date,
        total: User.where('users.created_at < ?', date).count,
        signed: User.where('users.created_at < ? AND users.sign_in_count = 0', date).count
      }
    end
    render json: { users: total.as_json }, status: 200
  end

end
