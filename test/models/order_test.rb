require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "creating an order when there is enough stock" do
    product = create :product, stock_level: 100
    order = build :order, product: product, quantity: 90
    assert_difference('product.reload.stock_level', -90) do
      assert order.save
    end
  end

end
