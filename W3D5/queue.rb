class QueueNode
    attr_reader :data
    attr_accessor :next

    def initialize(data)
        @data = data
        @next = nil
    end

end


class Queue

    attr_accessor :head, :end

    def initialize
        @head = nil
        @end = nil
    end

    def enqueue(el)
        queue_node = QueueNode.new(el)
        if self.head == nil # if queue is empty, put it at the head
            self.head = queue_node 
            self.end = queue_node # have the end point to the head as well
        else
            self.end.next = queue_node # have the end's tail point to the node
            self.end = self.end.next # move the end pointer to the node so that the end always points to the end of the queue
        end 
    end

    def dequeue
        self.head = self.head.next
    end

    def peek
        self.head
    end

end


queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

p queue.peek.data
queue.dequeue
p queue.peek.data
queue.dequeue
p queue.peek.data
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(9)
p queue.peek.data
queue.dequeue
queue.dequeue
queue.dequeue
p queue.peek.data

