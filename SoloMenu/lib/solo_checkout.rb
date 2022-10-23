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
        #API link and code in here 
    end

end