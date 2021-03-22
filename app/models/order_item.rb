class OrderItem < ApplicationRecord
  validates :sku_code, presence: true
  belongs_to :order, optional: true
end
