require 'test_helper'

class OrderPlacementTest < ActiveSupport::TestCase

  test "placing an order when there is enough stock" do
    product = create :product, stock_level: 100, min_stock_level: 50
    order = Order.new(product: product, quantity: 10)
    order_placement = OrderPlacement.new(order)
    assert_no_difference('Notification.count') do
      order_placement.place
    end
    assert_equal 90, product.reload.stock_level
    assert order.persisted?
  end

  test "placing an order which triggers a reorder notification" do
    product = create :product, stock_level: 100, min_stock_level: 50
    order = Order.new(product: product, quantity: 60)
    order_placement = OrderPlacement.new(order)
    assert_difference('Notification.count') do
      order_placement.place
    end
    assert_equal 40, product.reload.stock_level
    assert order.persisted?
  end


end
