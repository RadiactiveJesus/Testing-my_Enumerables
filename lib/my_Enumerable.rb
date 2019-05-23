module Enumerable
    def my_each
        if self.class == Array
            for i  in self
                yield(self[i])
            end 
        elsif self.class == Hash
            for i in self do
                yield(self.keys[i], self.value[i])
            end
        end 
        self
    end
    def my_each_with_index
        if self.class == Array
            for i in (0...self.length) do
                yield(self[i], i)
            end
        elsif self.class == Hash
            for i in (0...self.keys.length) do
                yield(self.keys[i], self.values[i], i)
            end
        end
    end
    def my_select
        if self.class == Array
            selected = []
            for i in self
                selected << i if ( yield(i) == true )
            end
            selected
        elsif self.class == Hash
            result_hash = {}
            self.my_each do |key, value|
                if yield(key, value)
                    result_hash[key] = value
                end
            end
            result_hash
        end 
    end
    def my_all?
        if self.class == Array
            for i in self
                return false if ( yield(i) == false)              
            end
        elsif self.class == Hash
            for i, index in self
                return false if ( yield(i, index) == false)              
            end
        end
        return true
    end
    def my_any?
        if self.class == Array
            self.my_each do |value|
                if yield(value)
                    return true
                end
            end
        elsif self.class == Hash
            self.my_each do |key, value|
                if yield(key, value)
                    return true
                end
            end
            false
        end
    end
    def my_none?
        if self.class == Array
            self.my_each do |value|
                if yield(value)
                    return false
                end
            end
        elsif self.class == Hash
            self.my_each do |key, value|
                if yield(key, value)
                    return false
                end
            end
            false
        end
        true
    end
    def my_count
        count = 0
        if block_given?
            for i in 0..self.length - 1
                if yield self[i]
                  count += 1
                end
            end
        else
            count = self.length
        end
        return count
    end
    def my_map (p = nil)
        item = []
        i = 0
        while i < self.length
          if not block_given?
            result = p.call
            item.push(result)
          else
            result = yield self[i]
            item.push(result)
          end
          i = i + 1
        end
        item
    end
    def my_inject accumulator = nil 
        i = 0
        accumulator = self[i] if accumulator == nil 
        while i < self.length 
            if accumulator == self[0] && i == 0
                i += 1
                accumulator = yield(accumulator,self[i]) 
                i += 1
            else
                accumulator = yield(accumulator,self[i])
                i += 1
            end
        end
        accumulator 
    end
end

