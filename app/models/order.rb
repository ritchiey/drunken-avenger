class Order < ActiveRecord::Base

  belongs_to :product
  before_save :remove_from_stock

  private

  def remove_from_stock
    product.stock_level -= quantity
    product.save!
  end

end
