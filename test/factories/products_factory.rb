FactoryGirl.define do

  factory :product do
    sequence(:name) {|i| "Product #{i}" }
    stock_level 0
    min_stock_level 0
  end

end
