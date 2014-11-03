class Api::Networks::NetworksController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json

  def index
    render json: { networks: Network.order(:subdomain).as_json(only: [:id, :subdomain, :name, :created_at]) }, status: 200
  end
end