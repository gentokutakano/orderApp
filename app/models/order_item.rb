class OrderItem < ApplicationRecord
  # validates :sku_code, uniqueness: true
  belongs_to :order
end
