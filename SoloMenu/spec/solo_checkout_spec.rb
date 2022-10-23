#TODO fix error messages in interface
#TODO add ending options/interface in checkout
#TOD fix existing code tests
#TODO test drive the terminal commands in interfacing method
#TODO test drive the twilio integration and actually do it

require 'solo_menu'
require 'solo_ordering'
require 'solo_checkout'

RSpec.describe Checkout do

    it "3 - INT placeorder shows orderconf correctly" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        orderapp.interfacing
        orderapp.selectitems(orderapp.dish, orderapp.dishcount)
        check1 = Checkout.new(orderapp)
        expect(check1.orderconf).to eq "4x Wine, total = £48"
    end

    xit "3 - DOUB placeorder shows orderconf correctly" do
        exmenu = double :menu
        orderapp = double :orders, choices: ["2x Wine £24"]      
        check1 = Checkout.new(orderapp)
        expect(check1.orderconf).to eq "2x Wine £24"
    end

    xit "4 - INT shows orderplaced status correctly as false" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        orderapp.selectitems(orderapp.interfacing)
        check1 = Checkout.new(orderapp)
        expect(check1.orderplaced).to eq false
    end 

    xit "4 - DOUB shows orderplaced status correctly as false" do
        exmenu = double :menu
        orderapp = double :orders, choices: ["2x Wine £24"]      
        check1 = Checkout.new(orderapp)
        expect(check1.orderplaced).to eq false
    end 

    xit "5 - INT shows orderplaced status correctly as true" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        orderapp.selectitems(orderapp.interfacing)
        check1 = Checkout.new(orderapp)
        check1.placeorder
        expect(check1.orderplaced).to eq true
    end 

    xit "5 - DOUB shows orderplaced status correctly as true" do
        exmenu = double :menu
        orderapp = double :orders, choices: ["2x Wine £24"]      
        check1 = Checkout.new(orderapp)
        check1.placeorder
        expect(check1.orderplaced).to eq true
    end 

    xit "6 - UNIT sendconf returns error if order not placed" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        orderapp.selectitems(orderapp.interfacing)
        check1 = Checkout.new(orderapp)
        expect{check1.sendconf}.to raise_error ("no order placed")
    end

    xit "7 - INT sendconf sends a twilio text correctly" do

    end

    xit "7 - DOUB sendconf sends a twilio text correctly" do
        
    end
end