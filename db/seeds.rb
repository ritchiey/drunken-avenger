# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
{
  "Fish" => [20, 10],
  "Hamburger" => [80, 20],
  "Fizzy Drink" => [100, 50]
}.each do |name, stock|
  Product.where(name: name).first_or_create(
    name: name,
    stock_level: stock.first,
    min_stock_level: stock.last
  )
end
