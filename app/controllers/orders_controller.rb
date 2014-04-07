class OrdersController < ApplicationController

  def index
  end

  def create
    order = Order.new(order_params)
    product = order.product
    old_stock_level = product.stock_level
    product.update_attributes stock_level: product.stock_level - order.quantity
    product.save!
    if product.stock_level < product.min_stock_level && old_stock_level >= product.min_stock_level
      Notification.create message: "Buy more #{product.name}"
    end
    order.save
    redirect_to :action => :index
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end

end
