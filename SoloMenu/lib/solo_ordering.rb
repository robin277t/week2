class Ordering
    attr_accessor :choices
    def initialize(menuinstance) #menuinstance is an instance of Menu
        @menuinstance = menuinstance
        @choices = []
    end

    def interfacing
        "2x Wine £24"
        #"checkout"
    end

    def selectitems(selection)
        @choices.push(selection)
    end

    def viewmenu
        @menuinstance.menu
    end



end