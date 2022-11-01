#TOD fix existing code tests
#TODO test drive the terminal commands in interfacing method
#TODO test drive the twilio integration and actually do it

require 'solo_menu'
require 'solo_ordering'
require 'solo_checkout'

RSpec.describe Checkout do

    it "3 - INT placeorder shows orderconf correctly" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        check1 = Checkout.new("4x Wine, total = £48")
        orderapp.selectitems("Wine", 4)
        expect(check1.orderconf).to eq "4x Wine, total = £48"
    end

    it "3 - DOUB placeorder shows orderconf correctly" do
        exmenu = double :menu
        orderapp = double :orders, viewchoices: "4x Wine, total = £48"      
        check1 = Checkout.new("4x Wine, total = £48")
        expect(check1.orderconf).to eq "4x Wine, total = £48"
    end

    it "4 - INT shows orderplaced status correctly as false" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        check1 = Checkout.new("4x Wine, total = £48")
        orderapp.selectitems("Wine", 4)
        expect(check1.orderplaced).to eq false
    end 

    it "4 - DOUB shows orderplaced status correctly as false" do
        exmenu = double :menu
        check1 = Checkout.new("")
        orderapp = double :orders, viewchoices: "4x Wine, total = £48"      
        expect(check1.orderplaced).to eq false
    end 

    it "5 - UNIT shows orderplaced status correctly as true" do
        check1 = Checkout.new("")
        check1.placeorder
        expect(check1.orderplaced).to eq true
    end 

    it "6 - UNIT sendconf returns error if order not placed" do
        check1 = Checkout.new("")
        expect{check1.sendconf("dummy.txt")}.to raise_error ("no order placed")
    end

    it "7 - INT sendconf sends a twilio text correctly" do 
        check1 = Checkout.new("")
        check1.placeorder
        expect(check1.sendconf("./lib/Twiliokeys.txt")).to eq ("text sent")
    end

    # it "7 - DOUB sendconf sends a twilio text correctly" do #HOW DO I DOUBLE OR STUB THIS WHEN THE METHOD SENDS A TEXT?
    #     check1 = Checkout.new("")
    #     twiliodouble = double :twilio
    #     check1.placeorder
    #     #expect(check1.sendconf("dummy.txt")).to eq ("text sent")
    # end

    it "8 - INT @orderconf shows receipt of what ordered blank" do
        exmenu = Menu.new
        check1 = Checkout.new("")
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine", 4)
        expect(check1.orderconf).to eq ("")
    end

    it "8 - DOUB @orderconf shows receipt of what ordered blank" do
        exmenu = double :menu
        orderapp = double :ordering, viewchoices: "Wine, 4"
        check1 = Checkout.new("")
        expect(check1.orderconf).to eq ("")
    end

   it "9 - INT @orderconf shows receipt of what ordered" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.choices = [{"Wine" => 1}]
        orderapp.total = 12
        orderapp.viewchoices
        check1 = Checkout.new(orderapp.viewchoices)
        check1.orderplaced = true
        expect(check1.orderconf).to eq ("1x Wine, total = £12")
    end

    it "9 - DOUB @orderconf shows receipt of what ordered" do
        exmenu = double :menu
        orderapp = double :ordering, viewchoices: "4x Wine, total = £48"
        check1 = Checkout.new(orderapp.viewchoices)
        check1.orderplaced = true
        expect(check1.orderconf).to eq ("4x Wine, total = £48")
    end

end