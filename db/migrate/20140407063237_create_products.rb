class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :min_stock_level
      t.integer :stock_level

      t.timestamps
    end
  end
end
