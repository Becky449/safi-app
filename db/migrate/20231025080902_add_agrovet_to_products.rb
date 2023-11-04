class AddAgrovetToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :agrovet, foreign_key: true
  end
end
