class Agrovet < ApplicationRecord
  belongs_to :user
  has_many :data_entries
  has_many :products
  has_many :orders

  validates :name, presence: true
  validates :location, presence: true
  validates :owner_name, presence: true
  validates :owner_phone, presence: true
  validates :owner_email, presence: true
  validates :user_id, presence: true

  # def self.search(search)
  #   if search
  #     where(["name LIKE ?","%#{search}%"])
  #   else
  #     all
  #   end
  # end
    # Method to retrieve the latest form entry for the agrovet
  # def all_latest_data_entry
  #   @data_entries.order(created_at: :desc).first
  # end
  # def all_latest_product_1_data_entry_total
  #   (@products.first&.price || 0) * (@all_latest_data_entry&.product_1_quantity || 0)
  # end
  # def all_latest_product_2_data_entry_total
  #   (@products.second&.price || 0) * (@all_latest_data_entry&.product_2_quantity || 0)
  # end
  # def all_latest_product_3_data_entry_total
  #   (@products.third&.price || 0) * (@all_latest_data_entry&.product_3_quantity || 0)
  # end
  # def all_latest_product_4_data_entry_total
  #   (@products.fourth&.price || 0) * (@all_latest_data_entry&.product_4_quantity || 0)
  # end

  # def all_latest_total_data_entry_amount
  #   @all_latest_product_1_data_entry_total + @all_latest_product_2_data_entry_total + @all_latest_product_3_data_entry_total + @all_latest_product_4_data_entry_total
  # end
end
