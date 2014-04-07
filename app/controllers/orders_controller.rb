class OrdersController < ApplicationController

  def index
  end

  def create
    order = Order.new(order_params)
    OrderPlacement.new(order).place
    redirect_to :action => :index
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end

end
