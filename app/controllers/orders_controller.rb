class OrdersController < ApplicationController

  def index
  end

  def create
    Order.create(params.require(:order).permit(:product_id, :quantity))
    redirect_to :action => :index
  end

end
