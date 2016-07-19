require './lib/total_price_discount'
require './lib/item_price_discount'
require './lib/item'
require './lib/checkout'

price_discount = TotalPriceDiscount.new(60, 10)
item_discount = ItemPriceDiscount.new(product_code: '001', new_price: 8.5, quantity_threshold: 2)

promo_rules = [price_discount, item_discount]

item1 = Item.new('001', 'Lavender heart', 9.25)
item2 = Item.new('002','Personalised cufflinks',45.00 )
item3 = Item.new('003','Kids T-shirt', 19.95 )

puts "Test data"
puts "­­­­­­­­­"
puts "Basket:001,002,003"
co = Checkout.new promo_rules

co.scan(item1)
co.scan(item2)
co.scan(item3)
puts "Total price :£#{co.total}"
puts ' '

puts "Basket:001,003,001"
co = Checkout.new promo_rules

co.scan(item1)
co.scan(item3)
co.scan(item1)
puts "Total price :£#{co.total}"
puts ' '

puts "Basket:001,002,001,003"
co = Checkout.new promo_rules

co.scan(item1)
co.scan(item2)
co.scan(item1)
co.scan(item3)
puts "Total price :£#{co.total}"
puts ' '

