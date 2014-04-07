class OrdersController < ApplicationController

  def index
  end

  def create
    order = Order.new(params.require(:order).permit(:product_id, :quantity))
    OrderPlacement.new(order).place
    redirect_to :action => :index
  end

end
