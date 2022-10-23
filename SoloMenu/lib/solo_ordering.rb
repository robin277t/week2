#From interface, a matching string of the KEY of the menu hash
#From interface, a temp variable that is the count number of the ordered item.
#From interface, menu VALUE * by temp variable above ADDED to @total

#Take item that matches from menu hash and push name and temp variable of count
# into 'choices' array



class Ordering
    attr_accessor :choices
    attr_accessor :total
    attr_accessor :dish #can be hidden later once tests changed
    attr_accessor :dishcount #can be hidden later once tests changed
    def initialize(menuinstance,checkout) #menuinstance is an instance of Menu
        @menuinstance = menuinstance
        @checkoutinstance = checkout
        @choices = []
        @total = 0
        #@io = Kernel
    end

    def interfacing
        @dish = "Wine"
        @dishcount = 4
        input1 = ""
        input2 = ""
        input3 = ""
        puts "Welcome to takeaway app."
        while input1 != "checkout" do
            puts "What would you like to do? (see menu, see basket, 'select items', 'checkout')"
            input1 = gets.chomp
            if input1 == "see menu" 
                @menuinstance.menu.map{|item, price| puts "#{item} - £#{price}"}
            elsif input1 == "see basket"
                if viewchoices == ", total = £0" 
                    puts "basket empty"
                else 
                    puts viewchoices
                end
            elsif input1 == "select items"
                while input2 != "back"
                puts "please enter the name of the dish you wish to order, type 'back' to finish adding"
                input2 = gets.chomp
                #check on incorrect string here
                break if input2 == "back"
                puts "how many of these would you like?"
                input3 = gets.chomp.to_i
                selectitems(input2, input3)
                end
            end
        end
        @checkoutinstance.placeorder
        @checkoutinstance.orderconf = viewchoices
    end


    def selectitems(selection,count) #selection is a key of the menu hash 
        @choices.push({selection => count})
        @total += count * (@menuinstance.menu[selection])
    end

    def viewmenu
        @menuinstance.menu.map{|key, val| "#{key} - £#{val}"}.join(", ")
    end

    def viewchoices
        "#{choices.map{|hash| hash.map {|key,val| "#{val}x #{key}"}}.join(", ")}, total = £#{total}"
    end



end