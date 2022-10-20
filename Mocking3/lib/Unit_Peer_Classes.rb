class SecretDiary
    def initialize(diary) # diary is an instance of Diary
      @locked = true
      @entry = diary
    end
  
    def read
      # Raises the error "Go away!" if the diary is locked
      # Returns the diary's contents if the diary is unlocked
      # The diary starts off locked
       fail "Go away!" if @locked == true
       @entry.read

    end
  
    def lock
      @locked = true
    end
  
    def unlock
      @locked = false
    end
  end


class Diary
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end
end