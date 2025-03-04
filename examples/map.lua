local function map(t, f)
    local result = {}
    for i, v in ipairs(t) do
        result[i] = f(v)
    end
    return result
end

local function square(x)
    return x * x -- Square function
end

-- Usage
local numbers = {1, 2, 3, 4, 5}
local squares = map(numbers, function(x) return square(x) end)
for i, v in ipairs(squares) do
    print(v) -- 1, 4, 9, 16, 25
end
