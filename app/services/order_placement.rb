class OrderPlacement

  def initialize(order)
    @order = order
  end

  def place
    monitor_stock_levels do
      remove_from_stock(order.quantity)
    end
    order.save
  end

  private

  def monitor_stock_levels
    was_above_reorder_level = product.stock_level >= product.min_stock_level
    yield
    request_stock_order if was_above_reorder_level && below_reorder_level?
  end

  def below_reorder_level?
    product.stock_level < product.min_stock_level
  end

  attr_reader :order

  def product
    @order.product
  end

  def remove_from_stock(quantity)
    product.update_attributes(stock_level: product.stock_level - quantity)
  end

  def request_stock_order
    Notification.create message: "Buy more #{product.name}"
  end

end

    #product = order.product
    #old_stock_level = product.stock_level
    #product.save!
    #if product.stock_level < product.min_stock_level && old_stock_level >= product.min_stock_level
      #Notification.create message: "Buy more #{product.name}"
    #end
    #order.save
