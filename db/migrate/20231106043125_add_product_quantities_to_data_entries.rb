class AddProductQuantitiesToDataEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :data_entries, :product_5_quantity, :integer
    add_column :data_entries, :product_6_quantity, :integer
    add_column :data_entries, :product_7_quantity, :integer
  end
end
