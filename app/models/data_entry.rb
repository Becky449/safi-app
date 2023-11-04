class DataEntry < ApplicationRecord
  belongs_to :agrovet
  has_one :user, through: :agrovet

  def latest_total_data_entry_amount
    @latest_product_1_data_entry_total + @latest_product_2_data_entry_total + @latest_product_3_data_entry_total + @latest_product_4_data_entry_total
  end
end
