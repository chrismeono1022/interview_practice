require './stack_queue.rb'
require 'pry'

describe 'StackQueue' do
  shared_context 'StackQueue with one item' do
    let(:queue) { StackQueue.new }
    before { queue.enqueue('item') }
  end

  it 'initializes the class' do
    queue = StackQueue.new 
    expect(queue.stack_1).to eq []
    expect(queue.stack_2).to eq []
  end

  context 'with one item' do
    include_context 'StackQueue with one item'

    it 'enqueues an item' do
      expect(queue.stack_1).to eq ['item']
    end

    it 'dequeues an item' do
      expect(queue.stack_1).to eq ['item']

      expect(queue.dequeue).to eq 'item'
    end
  end

  context 'with multiple items' do
    include_context 'StackQueue with one item'

    before(:each) { queue.enqueue('item_2') }

    it 'queues another item' do
      expect(queue.stack_1).to eq ['item', 'item_2']
    end

    it 'dequeus the correct item' do
      expect(queue.stack_1).to eq ['item', 'item_2']
      expect(queue.dequeue).to eq 'item'
      expect(queue.stack_1).to eq ['item_2']
    end
  end
end