class OrdersController < ApplicationController

  def index
  end

  def create
    Order.create(order_params)
    redirect_to :action => :index
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end

end
