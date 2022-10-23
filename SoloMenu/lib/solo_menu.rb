class Menu
    
    attr_accessor :menu
    
    def initialize
         @menu = {"Wine" => 12, "Bread" => 5, "Beans" => 6}
    end

    def add(item,price)
        @menu[item] = price
    end

    def remove(item)
        @menu.delete(item)
    end

end