return function<T>(interval: number): { read remove: (T) -> (), read try: (T) -> boolean }
    local list = {}
    return table.freeze({
        --[=[
            Checks whether the throttle for a certain key is active

            ```lua
            local test = throttle.array(0.1) -- Creates a throttle with the interval of 0.1 secs
            

            test.try("Hello") -- false -> throttle is free
            test.try("World") -- false -> throttle is free
            test.try("Hello") -- true  -> throttle is active
            ```

            @param key -- key that is used to index the array
            @return boolean -- Whether the throttle is active or not
        ]=]
        try = function(key: T): boolean
            local now: number = os.clock()
            local nextTime: number = list[key] or 0
            if now >= nextTime then
                list[key] = now + interval
                return false
            end
            return true
        end,
        --[=[
            Removes a key from the array

            ```lua
            local test = throttle.array(0.1) -- Creates a throttle with the interval of 0.1 secs
            

            test.try("Hello") -- false -> throttle is free
            test.try("Hello") -- true  -> throttle is active
            test.remove("Hello") -- removes "Hello" from the list
            test.try("Hello") -- false -> throttle is free
            ```

            @param key -- key that is used to index the array
        ]=]
        remove = function(key: T)
            list[key] = nil
        end,
    })
end
