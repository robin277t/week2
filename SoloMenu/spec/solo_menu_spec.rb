require 'solo_menu'
require 'solo_ordering'

RSpec.describe Menu do
    
    it "1 - INT Add method to menu works" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        exmenu.add("Cheese", 10)
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6, Cheese - £10")
    end

    it "1 - DOUB Add method to menu works" do
        exmenu = Menu.new
        orderapp = double :menu
        exmenu.add("Cheese", 10)
        expect(orderapp).to receive(:viewmenu).and_return("Wine - £12, Bread - £5, Beans - £6, Cheese - £10")
        expect(orderapp.viewmenu).to eq ("Wine - £12, Bread - £5, Beans - £6, Cheese - £10")
    end

    it "2 - INT Remove method to menu works" do
        exmenu = Menu.new
        orderapp = Ordering.new(exmenu,Kernel)
        exmenu.remove("Wine")
        expect(orderapp.viewmenu).to eq ("Bread - £5, Beans - £6")
    end

    it "2 - DOUB Remove method to menu works" do
        exmenu = Menu.new
        orderapp = double :menu
        exmenu.remove("Wine")
        allow(orderapp).to receive(:viewmenu).and_return("Bread - £5, Beans - £6")
        expect(orderapp.viewmenu).to eq ("Bread - £5, Beans - £6")
    end

end
