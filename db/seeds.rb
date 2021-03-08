# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zaikos = [
  { sku_code: "SKU0001", stock_type: '01', stock: 10},
  { sku_code: "SKU0002", stock_type: '01', stock: 5},
  { sku_code: "SKU0003", stock_type: '01', stock: 10},
  { sku_code: "SKU0004", stock_type: '02', stock: 0},
  { sku_code: "SKU0005", stock_type: '01', stock: 9},
  { sku_code: "SKU0006", stock_type: '02', stock: 0},
  { sku_code: "SKU0007", stock_type: '01', stock: 20},
  { sku_code: "SKU0008", stock_type: '01', stock: 30},
  { sku_code: "SKU0009", stock_type: '01', stock: 50},
  { sku_code: "SKU00010", stock_type: '01', stock: 100},
  { sku_code: "SKU00011", stock_type: '02', stock: 0},
  { sku_code: "SKU00012", stock_type: '01', stock: 200},
]
ActiveRecord::Base.transaction do
  zaikos.each do |zaiko|
    SoukoZaiko.create!(zaiko)
  end
end