local function createCounter()
    local count = 0
    return function ()
        count = count + 1
        return count
    end
end

-- Usage
local counter = createCounter()
print(counter()) -- 1
print(counter()) -- 2
print(counter()) -- 3
print(counter()) -- 4
print(counter()) -- 5