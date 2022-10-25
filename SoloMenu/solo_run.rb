$LOAD_PATH << "lib"
require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

menu = Menu.new

order = Ordering.new(menu,Kernel)
check1 = Checkout.new(order.interfacing)
check1.placeorder
puts "Thank you for your order, a confirmation text will be with you shortly"
puts "You ordered: #{check1.orderconf}"
puts "Please do leave us a good review :)"