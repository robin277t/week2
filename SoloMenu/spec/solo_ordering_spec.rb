require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

RSpec.describe Ordering do

   it "11 - UNIT shows @choices as a blank when nothing input" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        expect(orderapp.choices).to eq ([])
    end

   it "12 - INT viewmenu @menuhash" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6")
    end

    it "12 - DOUB viewmenu @menuhash" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5, "Beans" => 6} 
        orderapp = Ordering.new(exmenu,Kernel)
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6")
    end

    it "13 - INT selectitems shows @choices populated with 1 items use" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine",4)
        expect(orderapp.viewchoices).to eq "4x Wine, total = £48"
    end

    it "13 - DOUB selectitems shows @choices populated with 1 items use" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5, "Beans" => 6} 
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine",1)
        expect(orderapp.viewchoices).to eq "1x Wine, total = £12"
    end

    it "14 - INT selectitems shows @choices populated with 2 items use" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine",4)
        orderapp.selectitems("Bread",6)
        expect(orderapp.viewchoices).to eq "4x Wine, 6x Bread, total = £78"
    end


    it "14 - DOUB selectitems shows @choices populated with 1 items use" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5, "Beans" => 6} 
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine",1)
        orderapp.selectitems("Bread",6)
        expect(orderapp.viewchoices).to eq "1x Wine, 6x Bread, total = £42"
    end

    it "15 - DOUB interface give messages to and show calls methods correctly, 1: see menu + exit" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5} 
        inputkernel = double :inputkernel
        
        expect(inputkernel).to receive(:puts).with("Welcome to takeaway app.")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("see menu")
        expect(inputkernel).to receive(:puts).with("Wine - £12")
        expect(inputkernel).to receive(:puts).with("Bread - £5")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("exit")

        orderapp = Ordering.new(exmenu,inputkernel)
        orderapp.interfacing

    end

    it "16 - DOUB interface give messages to and show calls methods correctly, 2: selectitem x2 and see basket + checkout" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5} 
        inputkernel = double :inputkernel
        
        expect(inputkernel).to receive(:puts).with("Welcome to takeaway app.")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("select items")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("Bread")
        expect(inputkernel).to receive(:puts).with("how many of these would you like? (if you do not enter integer, nothing will be added)")
        expect(inputkernel).to receive(:gets).and_return("2")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("back")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("select items")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("Wine")
        expect(inputkernel).to receive(:puts).with("how many of these would you like? (if you do not enter integer, nothing will be added)")
        expect(inputkernel).to receive(:gets).and_return("1")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("back")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("see basket")
        expect(inputkernel).to receive(:puts).with("2x Bread, 1x Wine, total = £22")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("checkout")

        orderapp = Ordering.new(exmenu,inputkernel)
        expect(orderapp.interfacing).to eq ("2x Bread, 1x Wine, total = £22")
  
    end



    it "17 - DOUB interface give messages to and show calls methods correctly, 3: selectitem x1 incorrect, view empty basket, checkout fail, exit" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5} 
        inputkernel = double :inputkernel
      
        expect(inputkernel).to receive(:puts).with("Welcome to takeaway app.")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("select items")

        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("Breaddd")
        expect(inputkernel).to receive(:puts).with("not included, please re-enter")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("backkk")
        expect(inputkernel).to receive(:puts).with("not included, please re-enter")
        expect(inputkernel).to receive(:puts).with("please enter the name of the dish you wish to order, type 'back' to finish adding")
        expect(inputkernel).to receive(:gets).and_return("back")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("see basket")
        expect(inputkernel).to receive(:puts).with("basket empty")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("checkout")
        expect(inputkernel).to receive(:puts).with("Can't checkout, basket is empty - select another option")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("exittt")
        expect(inputkernel).to receive(:puts).with("What would you like to do? (see menu, see basket, select items, checkout, exit")
        expect(inputkernel).to receive(:gets).and_return("exit")

        orderapp = Ordering.new(exmenu,inputkernel)
        expect(orderapp.interfacing).to eq ("order failed, basket empty")

    end


    it "18 - INT selectitems shows @choices populated with 2 items of the same type + 1 other" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        orderapp.selectitems("Wine",4)
        orderapp.selectitems("Bread",3)
        orderapp.selectitems("Bread",3)
        expect(orderapp.viewchoices).to eq "4x Wine, 6x Bread, total = £78"
    end

end