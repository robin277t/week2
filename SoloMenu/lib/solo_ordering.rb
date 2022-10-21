class Ordering

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

    # maybe remove the below?
    def choicesmade
        @choices.join(", ")
    end

    def viewmenu
        @menuinstance.showmenu
    end



end