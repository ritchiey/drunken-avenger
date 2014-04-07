require 'test_helper'

class ProductTest < ActiveSupport::TestCase

   test "it notifies the storekeeper when the stock level drops" do
     product = create :product, name: 'fish', min_stock_level: 100, stock_level: 120
     assert_difference('Notification.count') do
       product.update_attributes stock_level: 90
     end
     assert Notification.last.message =~ /Buy more fish/
   end

   test "it doesn't notify the storekeeper if the stock level stays above the threshold" do
     product = create :product, name: 'fish', min_stock_level: 100, stock_level: 120
     assert_no_difference('Notification.count') do
       product.update_attributes stock_level: 110
     end
   end

   test "it doesn't notify the storekeeper if the stock level stays below the threshold" do
     product = create :product, name: 'fish', min_stock_level: 100, stock_level: 90
     assert_no_difference('Notification.count') do
       product.update_attributes stock_level: 80
     end
   end

end
