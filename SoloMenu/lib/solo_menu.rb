class Menu
    def initialize
        attr_accessor :menu = {"Wine" => "£12", "Bread" => "£5", "Beans" => "£6"}
    end

    #remove the below function
    def showmenu
        @menu
    end

    def add(item,price)
        @menu[item] = price
    end

    def remove(item)
        @menu.delete(item)
    end

end