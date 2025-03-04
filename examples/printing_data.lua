local data = {
    {name = "Alice", age = 30, city = "New York"},
    {name = "Bob", age = 25, city = "Los Angeles"},
    {name = "Charlie", age = 35, city = "Chicago"}
}
local function printData(data)
    for _, entry in ipairs(data) do
        for key, value in pairs(entry) do
            io.write(key .. ": " .. tostring(value) .. "\t")
        end
        io.write("\n")
    end
end
-- Usage
printData(data)