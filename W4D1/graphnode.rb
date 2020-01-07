class GraphNode

    attr_reader :val
    attr_accessor :neighbors, :visited

    def initialize(val)
        @val = val 
        @visited = false
        @neighbors = []
    end

end

def bfs(node, target)
    queue = [node] # start with the starting node in the queue
    while !queue.empty?
        curr_node = queue.shift # remove it from the queue
        curr_node.visited = true # mark is as visited
        return curr_node.val if curr_node.val == target # return the node value if it matches the target
        # only add neighbors to the queue if they haven't been visited
        curr_node.neighbors.each {|neighbor| queue << neighbor unless neighbor.visited}
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

# p bfs(a, "b")
# p bfs(a, "f")