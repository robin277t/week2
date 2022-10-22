class Checkout
    attr_accessor :orderconf
    attr_accessor :orderplaced
    def initialize(order) #order is an instance of Ordering
        @orderconf = order.choices.join(", ")
        @orderplaced = false
    end

    def placeorder
        @orderplaced = true
    end

    def sendconf
        fail "no order placed" unless @orderplaced == true 
    end

end