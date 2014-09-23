class Managers::DeliveriesController < Managers::BaseController
  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end
end