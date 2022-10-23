require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

RSpec.describe Ordering do

   it "11 - UNIT shows @choices as a blank when nothing input" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,"whatever")
        expect(orderapp.choices).to eq ([])
    end

   it "12 - INT viewmenu @menuhash" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,"whatever")
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6")
    end

    it "12 - DOUB viewmenu @menuhash" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5, "Beans" => 6} 
        orderapp = Ordering.new(exmenu,"whatever")
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6")
    end

    it "13 - INT selectitems shows @choices populated with 1 items use" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,"whatever")
        orderapp.selectitems("Wine",4)
        expect(orderapp.viewchoices).to eq "4x Wine, total = £48"
    end

    it "13 - DOUB selectitems shows @choices populated with 1 items use" do
        exmenu = double :menus, menu: {"Wine" => 12, "Bread" => 5, "Beans" => 6} 
        orderapp = Ordering.new(exmenu,"whatever")
        orderapp.selectitems("Wine",1)
        expect(orderapp.viewchoices).to eq "1x Wine, total = £12"
    end

end