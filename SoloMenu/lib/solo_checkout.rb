require 'twilio-ruby'

class Checkout
    attr_accessor :orderconf
    attr_accessor :orderplaced
    def initialize(orderinfo) # orderinfo is viewchoices receipt from ordering
        @orderconf = orderinfo
        @orderplaced = false
    end

    def placeorder
        @orderplaced = true
    end

    def sendconf(filename)
        fail "no order placed, please try again" unless @orderplaced == true
        data = File.readlines(filename)[0].split("=")

        account_sid = data[1]
        auth_token = data[3]
        phone_number_from = data[7]
        phone_number_to = data[9]

        client = Twilio::REST::Client.new(account_sid, auth_token)
        
        time60 = (Time.now + 3600).strftime('%H:%M')
        
        client.messages.create(
            from: phone_number_from,
            to: phone_number_to,
            body: "Your order of #{@orderconf} will be with you by #{time60}"
            )
        return "text sent"
    end
end
