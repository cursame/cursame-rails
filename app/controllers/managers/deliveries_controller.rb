class Managers::DeliveriesController < Managers::BaseController
  def index
    @deliveries = current_network.deliveries.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @delivery = Delivery.find_by_id params[:id]
  end

  def destroy
    @delivery = Delivery.find_by_id params[:id]
    @delivery.destroy
    
    redirect_to managers_deliveries_path, flash: { success: t('.managers.hmwrk_delete') }
  end
end