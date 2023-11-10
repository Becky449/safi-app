class RemoveAgrovetIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :agrovet_id
  end
end
