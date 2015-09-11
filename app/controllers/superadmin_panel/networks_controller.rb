class SuperadminPanel::NetworksController < SuperadminPanel::BaseController
  include ActiveModel::ForbiddenAttributesProtection

  def index
    @networks = Network.order(:subdomain)
    search = params[:search] ? params[:search].strip.squeeze(' ').downcase : ''
    if params[:subdomain]
      @networks = @networks.where('LOWER(subdomain) LIKE ?', "%#{search}%")
    end

    if params[:name]
      @networks = @networks.where('LOWER(name) LIKE ?', "%#{search}%")
    end
    @networks = @networks.paginate(page: params[:page], per_page: 30)
  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      redirect_to superadmin_panel_network_path(@network)
    else
      render :action => :new
    end
  end

  def edit
    @network = Network.find_by_id params[:id]
  end

  def update
    @network = Network.find_by_id(params[:id])
    if @network.update_attributes(network_params)
      redirect_to superadmin_panel_network_path(@network)
    else
      render action: :edit
    end
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

  def network_params
    params.require(:network).permit(:name, :subdomain, :population, :public_register,
                                    :welcom_message)
  end
end
