class SuperadminPanel::NetworksController < SuperadminPanel::BaseController
  def index
    @networks = Network.order(:subdomain).paginate(page: params[:page], per_page: 30)
  end

  def new
    @network = Network.new
  end

  def create
    set_params(nil)
  end

  def edit
    @network = Network.find_by_id params[:id]
  end

  def update
    set_params(params[:id])
  end

  def show
    @network = Network.find_by_id params[:id]
  end

  def destroy
    network = Network.find_by_id params[:id]
    network.destroy

    redirect_to superadmin_panel_networks_path
  end

  private

  def set_params(id)
    if id
      network = Network.find_by_id(id)
    else
      network = Network.new params[:network]
    end

    if !id && !network.save
      redirect_to superadmin_panel_networks_path, flash: { error: 'error' }
      return
    end

    if id && !network.update_attributes(params[:network])
      redirect_to superadmin_panel_networks_path, flash: { error: 'error' }
      return
    end

    redirect_to superadmin_panel_network_path(network), flash: { success: 'success' }
  end
end
