require 'solo_checkout'
require 'solo_menu'
require 'solo_ordering'

RSpec.describe Ordering do

    it "11 - UNIT shows @choices as a blank when nothing input" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        expect(orderapp.choices).to eq ([])
    end

    it "12 - INT viewmenu @menuhash" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu)
        expect(orderapp.viewmenu).to eq ({"Wine" => "£12", "Bread" => "£5", "Beans" => "£6"})
    end

    it "12 - DOUB viewmenu @menuhash" do
        exmenu = double :menus, menu: {"Wine" => "£12", "Bread" => "£5", "Beans" => "£6"} 
        orderapp = Ordering.new(exmenu)
        expect(orderapp.viewmenu).to eq ({"Wine" => "£12", "Bread" => "£5", "Beans" => "£6"})
    end

end