require 'mockingapi'

RSpec.describe ActivitySuggester do
    it "calls an API to provide a suggested activity" do
      requester_dbl = double :requester
      # We expect `requester_dbl` to be called with `#get` and the right args
      # And we tell it to return a sample output of the API
      # I got this using `curl "https://www.boredapi.com/api/activity"`
      expect(requester_dbl).to receive(:get)
        .with(URI("https://www.boredapi.com/api/activity"))
        .and_return('{"activity":"Take your dog on a walk","type":"relaxation","participants":1,"price":0,"link":"","key":"9318514","accessibility":0.2}')
  
      activity_suggester = ActivitySuggester.new(requester_dbl)
      result = activity_suggester.suggest
      expect(result).to eq "Why not: Take your dog on a walk"
    end
  end

#####################################

RSpec.describe "time " do

    it "unit tests for TimeError class 1" do
        
        requester_double = double :requester
        
        #expect(test).to receive(:get_time)
        expect(requester_double)
            .to receive(:get)
            .with(URI("https://worldtimeapi.org/api/ip"))
            .and_return('{"abbreviation":"BST","client_ip":"213.230.194.2","datetime":"2022-10-20T13:06:08.060459+01:00","day_of_week":4,"day_of_year":293,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1666267568,"utc_datetime":"2022-10-20T12:06:08.060459+00:00","utc_offset":"+01:00","week_number":42}')
        test = TimeError.new(requester_double)  
        expect(test.error).to eq (29.408333)
    end

end



#####################################

RSpec.describe "challenge" do

    it "cats 1" do
        doublegetter = double :doublegetter
        expect(doublegetter).to receive(:get)
        .with(URI("https://catfact.ninja/fact"))
        .and_return('{"fact":"In one stride, a cheetah can cover 23 to 26 feet (7 to 8 meters).","length":65}')
        
        new_cat = CatFacts.new(doublegetter)
        expect(new_cat.provide).to eq "Cat fact: In one stride, a cheetah can cover 23 to 26 feet (7 to 8 meters)."
    end


end