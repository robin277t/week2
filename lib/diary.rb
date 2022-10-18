class Diary
  def initialize
    @thoughts = []
    @list = []
    @mobile_numbers = []
  end

  def add_thought(thought)
    @thoughts << thought
  end

  def add_task(task)
    @list << task
  end

  def show_thoughts
    @thoughts
  end

  def show_list
    @list
  end

  def available_to_read(wpm, minutes)
    @thoughts.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

  def add_numbers
    @mobile_numbers = @thoughts.map {|x| x.thought}.join(" ").split.filter do |x| 
      x.include?("07") && x.length == 11
    end
  end

  def show_numbers
    @mobile_numbers
  end
end