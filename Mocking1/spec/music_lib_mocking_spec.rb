require 'music_lib_mocking'

describe "Integration tests: " do
    
    it "3 - MusicLibrary.add correctly adds and displays 1 track" do
        lib = MusicLibrary.new
        track1 = Track.new("song1", "unknown artist")
        lib.add(track1)
        expect(lib.all).to eq([track1])
    end

    it "4 - MusicLibrary.add correctly adds and displays 2 tracks" do
        lib = MusicLibrary.new
        track1 = Track.new("song1", "unknown artist")
        track2 = Track.new("song2", "blur")
        lib.add(track1)
        lib.add(track2)
        expect(lib.all).to eq([track1, track2])
    end

    it "5 - MusicLibrary search function works" do
        lib = MusicLibrary.new
        track1 = Track.new("song2", "unknown artist")
        track2 = Track.new("song2", "blur")
        track3 = Track.new("songer3", "someone")
        track4 = Track.new("songer4", "a band")
        lib.add(track1)
        lib.add(track2)
        lib.add(track3)
        lib.add(track4)
        expect(lib.search("songer")).to eq([track3, track4])
    end

end



describe "Unit tests: " do

    it "1 - Track.matches returns true correctly" do
        track = Track.new("song1", "me")
        expect(track.matches?("me")).to eq(true)
    end

    it "2 - Track.matches returns false correctly" do
        track = Track.new("song1", "me")
        expect(track.matches?("you")).to eq(false)
    end

end



describe "Unit Mocking tests: " do
    
    it "6 - MusicLibrary.add correctly adds and displays 1 track MOCK" do
        lib = MusicLibrary.new
        track1 = double(:faketrackk, title: "song1", artist: "me")
        lib.add(track1)
        expect(lib.all).to eq([track1])
    end

    it "7 - MusicLibrary.add correctly adds and displays 2 tracks MOCK " do
        lib = MusicLibrary.new
        track1 = double(:faketrack1, title: "song1", artist: "me")
        track2 = double(:faketrack2, title: "song2", artist: "someone")
        lib.add(track1)
        lib.add(track2)
        expect(lib.all).to eq([track1, track2])
    end

    it "8 - search fundtion works MOCK " do
        lib = MusicLibrary.new
        track1 = double(:faketrack1, title: "song2", artist:"unknown artist")
        track2 = double(:faketrack2, title: "song2", artist: "blur")
        track3 = double(:faketrack3, title: "songer3", artist: "someone")
        track4 = double(:faketrack4, title: "songer4", artist: "a band")
        lib.add(track1)
        lib.add(track2)
        lib.add(track3)
        lib.add(track4)
        expect(lib.search("songer")).to eq([track3, track4])
    end

end