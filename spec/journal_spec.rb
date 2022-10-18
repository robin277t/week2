require 'journal'

describe " journal tests: " do

    context "class tests for ThoughEntry: " do

        it " returns day correctly?" do
            example1 = ThoughtEntry.new("monday", "i love makers")
            expect(example1.day).to eq "monday"
        end

        it " returns thought correctly?" do
            example1 = ThoughtEntry.new("monday", "i love makers")
            expect(example1.thought).to eq "i love makers"
        end

        it " count words works?" do
            example1 = ThoughtEntry.new("monday", "i love makers")
            expect(example1.word_count).to eq 3
        end

        it " reading time works?" do
            example1 = ThoughtEntry.new("monday", "i love makers")
            expect(example1.reading_time(2)).to eq 2
        end


    end

end