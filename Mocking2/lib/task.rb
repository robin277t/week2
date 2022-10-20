class Task
  def initialize(title)
    @title = title
    @complete = false
  end

  def title
    return @title
  end

  def mark_complete
    @complete = true
  end

  def complete?
    return @complete
  end
end


class TaskList
  def initialize
    @tasks = []
  end

  def add(task)# assume this is an instance of Task
    @tasks << task
  end

  def all
    return @tasks
  end

  def all_complete?
    return false if @tasks.empty?
    return @tasks.all? {|task| task.complete?}
  end
end


class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - [x] Task title
   if @task.complete == false
      "- [ ] #{@task.title}"  
   else
      "- [x] #{@task.title}"
   end
  end
end
