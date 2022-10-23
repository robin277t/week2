class Checkout
    attr_accessor :orderconf
    attr_accessor :orderplaced
    def initialize
        @orderconf = ""
        @orderplaced = false
    end

    def placeorder
        @orderplaced = true
    end

    def sendconf
        fail "no order placed" unless @orderplaced == true 
    end

    def viewconf
        #is this needed or just do a view of @orderconf?
    end

end