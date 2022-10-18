require 'diary'

describe Diary do
  context 'nothing is added' do
    it 'returns empty list of thoughts' do
      my_diary = Diary.new
      expect(my_diary.show_thoughts).to eq []
    end

    it 'returns empty list of todos' do
      my_diary = Diary.new
      expect(my_diary.show_list).to eq []
    end
  end

end

describe 'diary integration tests' do
  context 'thoughts are added' do
    it 'shows thoughts' do
      my_diary = Diary.new
      my_thought = ThoughtEntry.new("wednesday", "I like cheese")
      my_diary.add_thought(my_thought)
      expect(my_diary.show_thoughts).to eq [my_thought]
    end
  end

  context 'tasks are added' do
    it 'shows tasks' do
      my_diary = Diary.new
      my_task = Todo.new("clean house")
      my_diary.add_task(my_task)
      expect(my_diary.show_list).to eq [my_task]
    end

    it 'shows which thoughts are available to read' do
      my_diary = Diary.new
      my_thought_1 = ThoughtEntry.new("wednesday", "I like cheese")
      my_thought_2 = ThoughtEntry.new("monday", "I like cheese on monday")
      my_thought_3 = ThoughtEntry.new("friday", "I like cheese today")
      my_thought_4 = ThoughtEntry.new("sunday", "I like cheese sometimes")
      my_diary.add_thought(my_thought_1)
      my_diary.add_thought(my_thought_2)
      my_diary.add_thought(my_thought_3)
      my_diary.add_thought(my_thought_4)
      expect(my_diary.available_to_read(2, 2)).to eq [my_thought_1, my_thought_3, my_thought_4]
    end

    it 'shows numbers from thoughts containing mobile phone numbers' do
      my_diary = Diary.new
      my_thought_1 = ThoughtEntry.new("wednesday", "I need to call Robin at 3pm on 07828392810")
      my_thought_2 = ThoughtEntry.new("monday", "call mum 07812321112 at lunch")
      my_thought_3 = ThoughtEntry.new("friday", "07128328191 call vet")
      my_thought_4 = ThoughtEntry.new("sunday", "call at 07:15 this morning")
      my_diary.add_thought(my_thought_1)
      my_diary.add_thought(my_thought_2)
      my_diary.add_thought(my_thought_3)
      my_diary.add_thought(my_thought_4)
      my_diary.add_numbers
      expect(my_diary.show_numbers).to eq ["07828392810", "07812321112", "07128328191"]
    end
  end
end