class Managers::DeliveriesController < Managers::BaseController
  def index
    @deliveries = Delivery.all
  end

  def show
    @delivery = Delivery.find_by_id params[:id]
  end

  def new
    @delivery = Delivery.new
  end

  def create
    redirect_to managers_deliveries_path, flash: { success: 'Tarea actualizada correctamente.' }
  end

  def edit
    @delivery = Delivery.find_by_id params[:id]
  end

  def update
    redirect_to managers_deliveries_path, flash: { success: 'Tarea actualizada correctamente.' }
  end

  def destroy
    redirect_to managers_deliveries_path, flash: { success: 'Tarea borrada correctamente.' }
  end
end