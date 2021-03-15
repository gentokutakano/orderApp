class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :total_amount
      t.integer :tax
      t.string :delivery_zipcode
      t.string :delivery_state
      t.string :delivery_city
      t.string :delivery_area
      t.string :delivery_address

      t.timestamps
    end
  end
end
