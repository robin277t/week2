## Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

---

add entries to diary
read diary entries
select diary entries based on time and reading speed
keep todo list together with diary
list mobile phone numbers in all diary entries


## Class System

_Also design the interface of each class in more detail._

```ruby
class Diary
 
end

class DiaryEntry
  
end

class TodoList

end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

Class tests for thoughtentry
UNIT: returns day correctly "wednesday" returns "wednesday"
UNIT: returns thought correctly "i like cheese" returns "i like cheese"
UNIT: count words works "i like cheese" = 3
UNIT: reading time works wpm = 2 "i like cheese" = 2

Class tests for TodoEntry
UNIT: task "get cheese" returns " get cheese"
UNIT: check_done "get cheese" returns false
UNIT: check_done " get cheese" + instance.markdone returns true
UNIT: check_done " get cheese + instance.markdone + instance.undodone = false

Class tests for Diary
UNIT: show_thoughts = []
UNIT: show_tasks = []
INTEGRATION: add_thoughts ("thoughtentry("weds","I hate cheese")). Show_thoughts = "Weds, I hate cheese"
INTEGRATION: add_tasks ("buy cheese"), show_tasks = "buy cheese"
INTEGRATION: available_to_read(2,2) (create entries x 5, 4 of which are 4 words or less), add entries), output should be list of entry titles of the 4 smaller entries
INTEGRATION: show_numbers, (create several thought entries containing phone numbers), output should be just those phone number@s

array.join(" ").split.select{|x| x.include?("07" && x.length == 11)}


POSSIBLE IMPROVEMENTS:
Scan task to do list for phone numbers also


## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

#TodoEntry

# returns task when given task
# 


```

_Encode each example as a test. You can add to the above list as you go._

