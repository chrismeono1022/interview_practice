=begin
  Task: Implement a queue using
  two stacks
=end

class StackQueue
  attr_reader :stack_1, :stack_2
  def initialize
    @stack_1 = []
    @stack_2 = []
  end

  def enqueue(item)
    @stack_1.push(item)
  end

  def dequeue
    @stack_2 = @stack_1[1..-1].reverse if @stack_1.length >= 1
    item = @stack_1.shift
    @stack_1 = @stack_2.reverse
    item
  end
end