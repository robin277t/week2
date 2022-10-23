$LOAD_PATH << "lib"
require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

menu = Menu.new
check = Checkout.new
order = Ordering.new(menu,check)

#while orderplaced = false do
order.interfacing
#end
#checkout new interface
puts check.orderplaced
puts check.orderconf