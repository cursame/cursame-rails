class SuperadminPanel::NetworksController < SuperadminPanel::BaseController
  def index
    @networks = Network.order(:subdomain).paginate(page: params[:page], per_page: 30)
  end

  def show
    @network = Network.find_by_id params[:id]
  end
end
