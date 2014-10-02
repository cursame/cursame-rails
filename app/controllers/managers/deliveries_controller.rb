class Managers::DeliveriesController < Managers::BaseController
  def index
    @deliveries = current_network.deliveries
  end

  def show
    @delivery = Delivery.find_by_id params[:id]
  end

  def destroy
    @delivery = Delivery.find_by_id params[:id]
    @delivery.destroy
    
    redirect_to managers_deliveries_path, flash: { success: 'Tarea borrada correctamente.' }
  end
end