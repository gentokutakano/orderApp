# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zaikos = [
  { sku_code: "SKU0001", stock_type: '01', stock: 10, price: 1000},
  { sku_code: "SKU0002", stock_type: '01', stock: 5, price: 800},
  { sku_code: "SKU0003", stock_type: '01', stock: 10, price: 2000},
  { sku_code: "SKU0004", stock_type: '02', stock: 0, price: 1500},
  { sku_code: "SKU0005", stock_type: '01', stock: 9, price: 3000},
  { sku_code: "SKU0006", stock_type: '02', stock: 0, price: 100},
  { sku_code: "SKU0007", stock_type: '01', stock: 20, price: 400},
  { sku_code: "SKU0008", stock_type: '01', stock: 30, price: 2500},
  { sku_code: "SKU0009", stock_type: '01', stock: 50, price: 700},
  { sku_code: "SKU00010", stock_type: '01', stock: 100, price: 2600},
  { sku_code: "SKU00011", stock_type: '02', stock: 0, price: 3100},
  { sku_code: "SKU00012", stock_type: '01', stock: 200, price: 6000},
]
ActiveRecord::Base.transaction do
  zaikos.each do |zaiko|
    SoukoZaiko.create!(zaiko)
  end
end