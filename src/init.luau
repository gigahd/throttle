local throttle = {}


--[=[
    Creats a new throttle function

    ```lua
    local test = throttle.new(0.1) -- Creates a throttle with the interval of 0.1 secs
    

    test() -- false -> throttle is free
    test() -- true  -> throttle is active
    ```

    @param interval -- Time it throttles
    @return () -> boolean -- Throttling function
]=]
throttle.new = require(script.throttle)

--[=[
    Checks whether the throttle for a certain key is active

    ```lua
    local test = throttle.array(0.1) -- Creates a throttle with the interval of 0.1 secs
    ```

    @param interval -- Time it throttles
    @return Throttleing array
]=]
throttle.array = require(script.throttleArray)

table.freeze(throttle)

return throttle
