class MusicLibrary
    def initialize
      @tracklist = []
    end
  
    def add(track)
      @tracklist << track
    end
  
    def all
      @tracklist
    end
    
    def search(keyword)
      @tracklist.filter{|trk| trk.title.include?(keyword)}
    end
  end



  class Track
    def initialize(title, artist) # title and artist are both strings
        @title = title
        @artist = artist
    end

    def title
        @title
    end
  
    def matches?(keyword) # keyword is a string
      if keyword == @title || keyword == @artist then true else false end
    end
  end