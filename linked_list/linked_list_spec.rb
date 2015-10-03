require './linked_list.rb'
require 'pry'

describe 'LinkedList' do

  context 'Node' do
    it 'initializes a Node' do
      node = Node.new('node')
      expect(node.data).to eq 'node'
    end
  end

  shared_context 'creating a linked list' do
    let(:node_3) { Node.new(3, nil) }
    let(:node_2) { Node.new(2, node_3) }
    let(:node_1) { Node.new(1, node_2) }
    let(:node_0) { Node.new(0, node_1) }

    it{ expect(node_0.next_node).to eq node_1 }
    it{ expect(node_1.next_node).to eq node_2 }
    it{ expect(node_2.next_node).to eq node_3 }
    it{ expect(node_3.next_node).to eq nil }
  end

  context 'Reverse list recursively' do
    include_context 'creating a linked list'

    it 'reverses the list recursively' do
      reverse_list_recursively!(node_0, nil)

      expect(node_0.next_node).to eq nil
      expect(node_1.next_node).to eq node_0
      expect(node_2.next_node).to eq node_1
      expect(node_3.next_node).to eq node_2
    end
  end

  context 'Reverse list iteratively' do
    include_context 'creating a linked list'

    it 'reverses the list iteratively' do
      reverse_list_iteratively!(node_0)
      expect(node_0.next_node).to eq nil
      expect(node_1.next_node).to eq node_0
      expect(node_2.next_node).to eq node_1
      expect(node_3.next_node).to eq node_2
    end
  end

  context 'LinkedList' do
    it 'initializes a LinkedList' do
      head = Node.new('head')
      tail = Node.new('tail')
      linked_list = LinkedList.new(head, tail)

      expect(linked_list.head).to eq head
      expect(linked_list.tail).to eq tail
    end
  end
end