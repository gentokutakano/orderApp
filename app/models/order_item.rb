class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  validates :sku_code, presence: true
  validates :order, presence: true
end
