class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :min_stock_level
      t.string :stock_level

      t.timestamps
    end
  end
end
