class Product < ActiveRecord::Base

  has_many :orders
  validates :name, :presence => true
  validates :stock_level, :presence => true
  validates :min_stock_level, :presence => true

  before_save :notify_if_low_on_stock

  private

  def notify_if_low_on_stock
    if old_stock_level >= min_stock_level && new_stock_level < min_stock_level
      Notification.create message: "Buy more #{name}"
    end
  end

  def old_stock_level
    (stock_level_change.first || 0)
  end

  def new_stock_level
    stock_level_change.last
  end

end
