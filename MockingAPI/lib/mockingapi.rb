require 'json'

class ActivitySuggester
  def initialize(requester) # requester is usually Net::HTTP
    @requester = requester
  end

  def suggest
    response = make_request_to_api
    return "Why not: #{response["activity"]}"
  end

  private

  def make_request_to_api
    # We use '@requester' rather than 'Net:HTTP'
    text_response = @requester.get(URI("https://www.boredapi.com/api/activity"))
    return JSON.parse(text_response)
  end
end

#####################################

require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time and the time on this computer
  def initialize(requester)
  #  @a = DateTime.parse("2022-10-20 11:03:35.668035 +0000").to_time
  #  @b = DateTime.parse("2022-10-20 12:01:39.179669 +0100").to_time
    @requester = requester
    @time = DateTime.parse("2022-10-20 13:05:38.652126 +0100").to_time
  end
  
  def error
    #return get_server_time - Time.now
    return get_server_time - @time
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    #text_response = Net::HTTP.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

######################################

require 'json'
require 'net/http'

class CatFacts

  def initialize(fake)
    @fake = fake
  end

  def provide
    return "Cat fact: #{get_cat_fact["fact"]}"
  end

  private

  def get_cat_fact
    text_response = @fake.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end

#cats = CatFacts.new
#p cats.provide

##############################################

class Greeter
    def initialize(io)
      @io = io
    end
  
    def greet
      @io.puts "What is your name?"
      name = @io.gets.chomp
      @io.puts "Hello, #{name}!"
    end
  end

 # g = Greeter.new(Kernel)
 # g.greet

##########################################

class InteractiveCalculator
    def initialize(inputkernel)
        @io = inputkernel
    end

    def run
         @io.puts "Hello. I will subtract two numbers.\nPlease enter a number"
         num1 = @io.gets.chomp.to_i
         @io.puts "Please enter another number"
         num2 = @io.gets.chomp.to_i
         @io.puts "Here is your result: #{num1} - #{num2} = #{(num1 - num2)}"  
         return "Here is your result: #{num1} - #{num2} = #{(num1 * num2)}" 
    end
end

#interactive_calculator = InteractiveCalculator.new(Kernel)
#interactive_calculator.run

###############################



# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX

class StringRepeater
    
    def initialize(input)
        @terminal_input = input
    end

    def run
        @terminal_input.puts "Hello. I will repeat a string many times.\nPlease enter a string"
        str = @terminal_input.gets.chomp
        @terminal_input.puts "Please enter a number of repeats"
        strcount = @terminal_input.gets.chomp.to_i
        @terminal_input.puts "Here is your result: #{(str * strcount)}"
        return str * strcount
    end

end 

#string_repeater = StringRepeater.new(Kernel)
#string_repeater.run