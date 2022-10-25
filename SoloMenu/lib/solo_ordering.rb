class Ordering
    attr_accessor :choices
    attr_accessor :total

    def initialize(menuinstance,specialk) #menuinstance is an instance of Menu, specialk is Kernel
        @menuinstance = menuinstance
        @choices = []
        @total = 0
        @io = specialk
    end

    def interfacing
        input1, input2, input3 = ""
        @io.puts "Welcome to takeaway app."
        while input1 != "checkout" || viewchoices == ", total = £0" || input1 != "exit" do 
            @io.puts "What would you like to do? (see menu, see basket, select items, checkout, exit"
            input1 = ""
            input1 = @io.gets.chomp
            if input1 == "see menu" 
                @menuinstance.menu.map{|item, price| @io.puts "#{item} - £#{price}"}
            elsif input1 == "see basket"
                if viewchoices == ", total = £0" 
                    @io.puts "basket empty"
                else 
                    @io.puts viewchoices
                end
            elsif input1 == "select items"
                while input2 != "back"
                    @io.puts "please enter the name of the dish you wish to order, type 'back' to finish adding"
                    input2 = @io.gets.chomp
                    if input2 == "back"
                        input2 = ""
                        break
                    end
                    if !@menuinstance.menu.include? input2
                        @io.puts "not included, please re-enter"
                        next
                    end 
                    @io.puts "how many of these would you like? (if you do not enter integer, nothing will be added)"
                    input3 = @io.gets.chomp.to_i
                    selectitems(input2, input3) if input3 > 0 
                    
                end
            elsif input1 == "exit"
                break
            elsif input1 == "checkout" && viewchoices == ", total = £0"
                @io.puts "Can't checkout, basket is empty - select another option"
            elsif input1 == "checkout" && viewchoices != ", total = £0"
                break
            end
        end
        if input1 == "checkout"
            return viewchoices
        else
            return "order failed, basket empty"
        end
    end


    def selectitems(selection,count) #selection is a key of the menu hash  
        if @choices.select{|hash| hash.include?(selection)} != []
            @choices.each do |hash| 
                if hash.include?(selection)
                    hash.update(hash) {|key, val| val + count}
                end 
            end
        else
            @choices.push({selection => count})
        end
        @total += count * (@menuinstance.menu[selection])
    end

    def viewmenu
        @menuinstance.menu.map{|key, val| "#{key} - £#{val}"}.join(", ")
    end

    def viewchoices
        "#{choices.map{|hash| hash.map {|key,val| "#{val}x #{key}"}}.join(", ")}, total = £#{total}"
    end



end