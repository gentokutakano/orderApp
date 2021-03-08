class CreateSoukoZaikos < ActiveRecord::Migration[6.1]
  def change
    create_table :souko_zaikos do |t|
      t.string :sku_code
      t.string :stock_type
      t.integer :stock

      t.timestamps
    end
    add_index :souko_zaikos, :sku_code, unique: true
  end
end
