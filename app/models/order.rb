class Order < ActiveRecord::Base

  belongs_to :product
  validates :product, :presence => true
  validates :quantity, :numericality => { greater_than: 0 }

  before_save :remove_from_stock

  private

  def remove_from_stock
    product.stock_level -= quantity
    product.save!
  end

end
