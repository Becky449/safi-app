class AddProductQuantitiesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :product_5_quantity, :integer
    add_column :orders, :product_6_quantity, :integer
    add_column :orders, :product_7_quantity, :integer
  end
end
