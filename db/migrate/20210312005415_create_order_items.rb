class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :sku_code
      t.integer :quantity
      t.integer :price
      t.integer :total_amount

      t.timestamps
    end
  end
end
