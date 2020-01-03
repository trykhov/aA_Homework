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


# Visualization

# start with an empty queue
queue = Queue.new

# add an object using Queue#enqueue
queue.enqueue(1)

# Queue: [1] 
#        head
#        end

queue.enqueue(2)

# Queue: [1] -> [2] 
#        head
#               end

queue.enqueue(3)

# Queue: [1] -> [2] -> [3]
#        head
#                      end

p queue.peek.data # returns queue.head

# removing first object
queue.dequeue
# from:
# Queue: [1] -> [2] -> [3]
#        head
#                      end

# to:
# Queue: [2] -> [3]
#       head
#               end

p queue.peek.data # returns 2
queue.dequeue
# Queue: [3]
#       head
#        end



