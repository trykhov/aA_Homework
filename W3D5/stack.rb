class StackNode

  attr_reader :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end

end


class Stack

    attr_accessor :head

    def initialize
      # create ivar to store stack here!
      @head = nil
    end

    def push(el)
      # adds an element to the stack
      stack_node = StackNode.new(el) # create a new stack node for the element
      stack_node.next = self.head # the new object is on top of the stack and below it is the current head of the stack
      self.head = stack_node # the new head of the stack is the new object
    end

    def pop
      # removes one element from the stack
      hold = self.head
      self.head = self.head.next # the head is the object below the current one
      hold # we return the value at hold
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      self.head
    end
  end

stack = Stack.new
stack.push(1)
p stack.peek.data
stack.push(2)
stack.push(3)

p stack.peek.data
stack.pop
stack.pop
p stack.peek.data