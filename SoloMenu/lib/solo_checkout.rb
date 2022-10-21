class Checkout

    def initialize(order) #order is an instance of Ordering
        attr_accessor :orderconf = order.choicesmade # if choicesmade removed do the join here?
        attr_accessor :orderplaced = false
    end

    #remove below?
    def viewconf
        @orderconf
    end

    #remove below?
    def viewstatus
        @orderplaced
    end

    def placeorder
        @orderplaced = true
    end

    def sendconf
        fail "no order placed" unless @orderplaced == true 
    end

end