class ThoughtEntry
    def initialize(day, thought)
        @day = day
        @thought = thought
    end

    def day
        @day
    end

    def thought
        @thought
    end

    def word_count
        @thought.split.length
    end

    def reading_time(wpm)
        (word_count / wpm.to_f).ceil
    end
end

