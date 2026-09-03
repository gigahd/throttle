return function(interval: number): () -> boolean
    local nextTime = 0
    return function(): boolean
        local now = os.clock()
        if now >= nextTime then
            nextTime = now + interval
            return false
        end
        return true
    end
end
