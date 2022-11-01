$LOAD_PATH << "lib"
require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

menu = Menu.new

order = Ordering.new(menu,Kernel)
check1 = Checkout.new(order.interfacing)
if check1.orderconf != "order failed, basket empty"
    check1.placeorder
end
check1.sendconf("./lib/Twiliokeys.txt")
puts "Thank you for your order, a confirmation text will be with you very shortly"
puts "You ordered: #{check1.orderconf}"
puts "Please do leave us a good review :)"