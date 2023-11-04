class CreateDataEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :data_entries do |t|
      t.references :agrovet, null: false, foreign_key: true
      t.integer :product_1_quantity
      t.integer :product_2_quantity
      t.integer :product_3_quantity
      t.integer :product_4_quantity
      t.integer :money_paid
      t.integer :money_owed

      t.timestamps
    end
  end
end
