class Api::Network::NetworksController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def index
    networks = Network.all.paginate(per_page: 100, page: params[:page] || 1)
    render json: { pages: networks.total_pages, teachers: networks.as_json(only: [:id, :subdomain, :name, :created_at]) }, status: 200
  end

end