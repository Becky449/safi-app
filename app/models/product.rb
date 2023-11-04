class Product < ApplicationRecord
    has_many :data_entries
    has_many :agrovets, through: :data_entries
    has_many :orders
    belongs_to :user
    belongs_to :agrovet
end
