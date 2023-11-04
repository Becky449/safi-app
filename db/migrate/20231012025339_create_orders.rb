class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :agrovet, null: false, foreign_key: true
      t.integer :order_number
      t.integer :product_1_quantity
      t.integer :product_2_quantity
      t.integer :product_3_quantity
      t.integer :product_4_quantity
      t.string :status

      t.timestamps
    end
  end
end
