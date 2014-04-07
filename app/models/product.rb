class Product < ActiveRecord::Base

  has_many :orders
  validates :name, :presence => true
  validates :stock_level, :presence => true
  validates :min_stock_level, :presence => true

end
