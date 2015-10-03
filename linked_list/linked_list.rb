=begin
  Implement a singly Linked List
  and reverse it
=end

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data      = data
    @next_node = next_node
  end
end

def reverse_list_iteratively!(start_node)
  current_node  = start_node
  next_node     = nil
  previous_node = nil

  while current_node
    next_node              = current_node.next_node
    current_node.next_node = previous_node
    previous_node          = current_node
    current_node           = next_node
  end
end

def reverse_list_recursively!(start_node, previous_node)
  if start_node == nil
    return
  else
    next_node = start_node.next_node
    start_node.next_node = previous_node
    previous_node = start_node

    reverse_list_recursively!(next_node, previous_node)
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end
end