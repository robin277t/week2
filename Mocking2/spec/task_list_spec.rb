require 'task_list'
require 'task'

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` behaviour
  
  it "adds tasks to a list MOCKING 1" do
    task_list = TaskList.new
    task_1 = double(:faketask1)
    task_2 = double(:faketask2)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "adds tasks to a list MOCKING 2" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  # Unit test `#all_complete?` behaviour

  it "marks tasks as complete MOCKING 1" do
    task_list = TaskList.new
    task_1 = double(:faketask1, complete?: true)
    task_2 = double(:faketask2, complete?: true)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to eq true
  end

  it "marks tasks as complete MOCKING 2" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "marks tasks as complete MOCKING 3" do
    task_list = TaskList.new
    task_1 = double(:faketask1, complete?: true)
    task_2 = double(:faketask2, complete?: false)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to eq false
  end

  it "FORMATTER mocking test1" do
    format1 = TaskFormatter.new(double(:task, title: "get milk", complete: false))
    expect(format1.format).to eq "- [ ] get milk"
  end

  it "FORMATTER mocking test2" do
    format1 = TaskFormatter.new(double(:task, title: "get milk", complete: true))
    expect(format1.format).to eq "- [x] get milk"
  end

end
