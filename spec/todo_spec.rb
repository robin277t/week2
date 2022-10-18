require 'todo'

describe Todo do
  context "when task is added" do
    it 'returns task' do
      my_task = Todo.new("get cheese")
      expect(my_task.task).to eq "get cheese"
    end
  end

  context "when task is marked done" do
    it 'returns true' do
      my_task = Todo.new("get cheese")
      my_task.mark_done
      expect(my_task.check_done).to eq true
    end
  end

  context "when task is not marked done" do
    it 'returns false' do
      my_task = Todo.new("get cheese")
      expect(my_task.check_done).to eq false
    end
  end

  context "when task is marked done, then undone" do
    it 'returns false' do
      my_task = Todo.new("get cheese")
      my_task.mark_done
      my_task.mark_undone
      expect(my_task.check_done).to eq false
    end
  end

end