class Order < ApplicationRecord
  belongs_to :agrovet
  has_one :user, through: :agrovet
  has_many :products, through: :agrovet

  STATUSES = %w[Pending Dispatched Received]

  validates :status, inclusion: { in: STATUSES }

  def humanize
    status.humanize
  end

  
end
