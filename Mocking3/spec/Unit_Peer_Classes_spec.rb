require_relative "../lib/Unit_Peer_Classes"

RSpec.describe"TestSuite || " do
    
    context "UNIT tests || " do
        it "1 does method read work correctly 1?" do
            dir1 = Diary.new("hello people")
            expect(dir1.read).to eq("hello people")
        end

        it "2 does method secret read fail correctly ?" do
            sdir1 = SecretDiary.new("oops")
            expect {sdir1.read}.to raise_error "Go away!"
        end

        it "3 does unlock followed by lock fail correctly ?" do
            sdir1 = SecretDiary.new("oops")
            sdir1.unlock
            sdir1.lock
            expect {sdir1.read}.to raise_error "Go away!"
        end
    end

    context "INTEGRATION and DOUBLE tests || " do
        it "SecretDiary read method works integration" do
            dir2 = Diary.new("hello people")
            sdir2 = SecretDiary.new(dir2)
            sdir2.unlock
            expect(sdir2.read).to eq "hello people"
        end

        it "SecretDiary takes instance of Diary and puts it in @entry DOUBLE" do
            dir3 = double(:diretry, read: "hello people")
            sdir3 = SecretDiary.new(dir3)
            sdir3.unlock
            expect(sdir3.read).to eq "hello people"
        end

    end


end
