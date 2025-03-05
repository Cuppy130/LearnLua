local function gcf(a, b)
    while b ~= 0 do
        local temp = b
        b = a % b
        a = temp
    end
    return a
end

local function findGCF(numbers)
    local result = numbers[1]
    for i = 2, #numbers do
        result = gcf(result, numbers[i])
    end
    return result
end

-- Example usage
local numbers = {48, 64, 16}
local result = findGCF(numbers)
print("The GCF of " .. table.concat(numbers, ", ") .. " is: " .. result)
-- Output: The GCF of 48, 64, 16 is: 16
