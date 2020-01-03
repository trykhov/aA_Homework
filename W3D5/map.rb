class MapNode

    def initialize(data)
        return nil unless data.is_a?(Array) && data.length == 2
        @data = data
    end

end

class Map

    attr_accessor :store

    def initialize
        @store = [] 
    end

    def set(key, value)
        map_node = MapNode.new([key, value])
        index = get(key)
        !index.nil? ? self.store[index] = [key, value] : self.store << [key, value]
    end

    def get(key)
        self.store.each_with_index {|pair, i| return i if pair[0] == key}
        nil
    end

    def show
        self.store
    end

    def delete(key)
        self.store = self.store.select {|pair| pair[0] != key }
    end

end

my_map = Map.new
my_map.set("k1", "v1")
my_map.set("k2", "v2")
my_map.set("k3", "v3")
my_map.set("k4", "v4")

p my_map.show
p my_map.get("k3")
my_map.set("k3", "v5")
p my_map.show

my_map.delete("k2")
p my_map.show