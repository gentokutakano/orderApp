class AddPriceToSoukoZaiko < ActiveRecord::Migration[6.1]
  def change
    add_column :souko_zaikos, :price, :integer, after: :stock
  end
end
