class Order < ActiveRecord::Base

  belongs_to :product
  validates :product, :presence => true
  validates :quantity, :numericality => { greater_than: 0 }

end
