$LOAD_PATH << "lib"
require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

menu = Menu.new
check = Checkout.new
order = Ordering.new(menu,check)
order.interfacing
check.sendconf
puts "Thank you for your order, a confirmation text will be with you shortly"
puts "You ordered: #{check.orderconf}"
puts "Please do leave us a good review :)"