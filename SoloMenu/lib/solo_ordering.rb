class Ordering
    attr_accessor :choices
    attr_accessor :total

    def initialize(menuinstance,checkout) #menuinstance is an instance of Menu
        @menuinstance = menuinstance
        @checkoutinstance = checkout
        @choices = []
        @total = 0
    end

    def interfacing
        input1, input2, input3 = ""
        puts "Welcome to takeaway app."
        while input1 != "checkout" || viewchoices == ", total = £0" do 
            puts "What would you like to do? (see menu, see basket, select items, checkout, exit)"
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
                break if input2 == "back"
                if !@menuinstance.menu.include? input2
                    puts "not included, please re-enter"
                    next
                end 
                puts "how many of these would you like?"
                input3 = gets.chomp.to_i
                selectitems(input2, input3)
                end
            elsif input1 == "exit"
                exit
            elsif input1 == "checkout" && viewchoices == ", total = £0"
                puts "Can't checkout, basket is empty - select another option"
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