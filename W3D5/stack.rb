class Stack

    attr_accessor :head, :next

    def initialize
      # create ivar to store stack here!
      @head = nil
      @next = nil
    end

    def push(el)
      # adds an element to the stack
      self.next = self.head
      self.head = el
    end

    def pop
      # removes one element from the stack
      hold = self.next
      self.head = self.next
      self.next = hold
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      self.head
    end
  end

p stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)

p stack.peek
stack.pop
p stack.peek
stack.pop
p stack.peek