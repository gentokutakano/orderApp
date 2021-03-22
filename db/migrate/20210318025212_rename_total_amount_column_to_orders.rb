class RenameTotalAmountColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :total_amount, :purchase_amount
  end
end
