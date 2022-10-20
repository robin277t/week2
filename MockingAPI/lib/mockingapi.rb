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

=begin
needed:

curl that link to get data stream

create an initializer on the above class, with an argument that will then become
a) the double in the test and 
b) switched out for Net:HTTP

in test the double needs to allow .get, and with the URI, and to return the data stream

actual test is
expect(new_cat.provide).to eq "whatever test here + fact"
=end